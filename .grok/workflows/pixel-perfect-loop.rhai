let meta = #{
    name: "pixel-perfect-loop",
    description: "Rebuild pixel-perfect demos against inspo with OpenCV as ground truth and LLM vision as advisory only",
    when_to_use: "Run when demos fail visual match to inspo/, after OpenCV scores drop, or to batch-fix all showcases without stopping",
    phases: [
        #{ title: "Baseline", detail: "OpenCV score every inspo-linked demo" },
        #{ title: "Triage", detail: "rank failures and pick work queue" },
        #{ title: "Rebuild wave", detail: "one agent per failing demo, exclusive file ownership" },
        #{ title: "Re-verify", detail: "OpenCV again — never trust agent self-grade" },
        #{ title: "Vision council", detail: "LLM judges diffs only with OpenCV numbers in hand" },
        #{ title: "Loop / report", detail: "repeat until threshold or max rounds" },
    ],
};

// --- schemas ---
let triage_schema = #{
    "type": "object",
    "required": ["queue", "notes"],
    "properties": #{
        "queue": #{
            "type": "array",
            "maxItems": 12,
            "items": #{
                "type": "object",
                "required": ["id", "demo", "inspo", "score", "priority", "why"],
                "properties": #{
                    "id": #{ "type": "string" },
                    "demo": #{ "type": "string" },
                    "inspo": #{ "type": "string" },
                    "score": #{ "type": "number" },
                    "priority": #{ "type": "string" },
                    "why": #{ "type": "string" },
                },
            },
        },
        "notes": #{ "type": "string" },
    },
};

let rebuild_schema = #{
    "type": "object",
    "required": ["id", "demo_path", "changed", "summary"],
    "properties": #{
        "id": #{ "type": "string" },
        "demo_path": #{ "type": "string" },
        "changed": #{ "type": "boolean" },
        "summary": #{ "type": "string" },
    },
};

let vision_schema = #{
    "type": "object",
    "required": ["id", "opencv_score", "agree_with_opencv", "severity_gaps", "next_actions"],
    "properties": #{
        "id": #{ "type": "string" },
        "opencv_score": #{ "type": "number" },
        "agree_with_opencv": #{ "type": "boolean" },
        "severity_gaps": #{
            "type": "array",
            "maxItems": 8,
            "items": #{ "type": "string" },
        },
        "next_actions": #{
            "type": "array",
            "maxItems": 6,
            "items": #{ "type": "string" },
        },
        "hallucination_risk": #{ "type": "string" },
    },
};

// --- args ---
// args.pass_score: OpenCV composite threshold (default 0.55)
// args.max_rounds: rebuild loops (default 2)
// args.max_per_wave: demos per parallel wave (default 4)
// args.ids: optional array of demo ids to limit scope
// args.skip_vision: if true, skip LLM vision council
// args.dry_run: if true, baseline + triage only

let pass_score = 0.55;
let max_rounds = 2;
let max_per_wave = 4;
let skip_vision = false;
let dry_run = false;
let only_ids = ();

if args != () {
    if args.pass_score != () { pass_score = args.pass_score; }
    if args.max_rounds != () { max_rounds = args.max_rounds; }
    if args.max_per_wave != () { max_per_wave = args.max_per_wave; }
    if args.skip_vision == true { skip_vision = true; }
    if args.dry_run == true { dry_run = true; }
    if args.ids != () { only_ids = args.ids; }
}

// ---------------------------------------------------------------------------
// PHASE 1 — Baseline OpenCV (ground truth; never skip)
// ---------------------------------------------------------------------------
phase("Baseline");
log("Starting HTTP server + OpenCV inspo verification (ground truth). LLMs do not score layout.");

let baseline_prompt = "";
baseline_prompt += "You are the OpenCV baseline runner for aliens-made-this.\n";
baseline_prompt += "Repo root is the current workspace (pixel-perfect/, inspo/, tools/verify-inspo.mjs).\n\n";
baseline_prompt += "MANDATORY steps (use shell tools; do not invent scores):\n";
baseline_prompt += "1) Ensure .venv-verify exists with opencv-python-headless, or create it:\n";
baseline_prompt += "   python3 -m venv .venv-verify && .venv-verify/bin/pip install -q opencv-python-headless numpy\n";
baseline_prompt += "2) Ensure tools/node_modules has puppeteer-core (cd tools && npm i puppeteer-core@23 if needed).\n";
baseline_prompt += "3) Start: python3 -m http.server 8765 --bind 127.0.0.1 in background.\n";
baseline_prompt += "4) Run: node tools/verify-inspo.mjs http://127.0.0.1:8765\n";
baseline_prompt += "5) Kill the http.server when done.\n";
baseline_prompt += "6) Read tools/verify-out/report.json and tools/verify-out/REPORT.md fully.\n";
baseline_prompt += "7) write_scratch is N/A — write a summary to tools/verify-out/BASELINE.md with the ranked table.\n\n";
baseline_prompt += "Known failure modes from this repo (do NOT paper over):\n";
baseline_prompt += "- Batch demos were one-shot HTML with wrong composition (flat cards vs dual phone mockups).\n";
baseline_prompt += "- LLM self-grade of 'pixel perfect' is untrusted — only report numbers from report.json.\n";
baseline_prompt += "- Screenshots must not be 404 pages (check mean brightness / file size).\n";
baseline_prompt += "- product-inspired demos without inspo (motherduck/harness/trading) are out of scope for scoring.\n\n";
baseline_prompt += "Return a short text summary of pass_score threshold ";
baseline_prompt += pass_score.to_string();
baseline_prompt += " and how many demos are below it. Cite real scores from report.json only.";

let baseline = agent(baseline_prompt, #{
    label: "opencv-baseline",
    capability_mode: "execute",
});

if baseline == () || baseline.success != true {
    pause("infra", "OpenCV baseline failed to run. Fix tools/verify-inspo.mjs / deps, then resume.");
}

// ---------------------------------------------------------------------------
// PHASE 2 — Triage queue from report.json (script enforces scope)
// ---------------------------------------------------------------------------
phase("Triage");

let triage_prompt = "";
triage_prompt += "Read tools/verify-out/report.json with the read_file tool (required).\n";
triage_prompt += "Build a work queue of demos with score < ";
triage_prompt += pass_score.to_string();
triage_prompt += " sorted worst-first.\n";
triage_prompt += "Each item needs: id, demo path, inspo path, score, priority (rewrite|rework|polish), why (1 sentence from real metrics).\n";
triage_prompt += "Max 12 items. If only_ids filter applies, keep only those ids: ";
triage_prompt += json_encode(only_ids);
triage_prompt += "\nDo not invent demos not in report.json. Empty queue is valid if all scores pass.\n";
triage_prompt += "notes: one paragraph on systemic issues (composition vs palette vs framing).\n";

let triage = agent(triage_prompt, #{
    label: "triage",
    capability_mode: "read-only",
    output_schema: triage_schema,
});

if triage == () || triage.success != true || triage.output == () {
    pause("verification", "Triage agent failed — cannot build work queue without report.json evidence.");
}

let queue = triage.output.queue;
if queue == () { queue = []; }

// Filter queue in Rhai if only_ids provided
let work = [];
if only_ids == () {
    for item in queue { work.push(item); }
} else {
    for item in queue {
        let keep = false;
        for id in only_ids {
            if item.id == id { keep = true; }
        }
        if keep { work.push(item); }
    }
}

// Cap wave size
let wave = [];
let i = 0;
for item in work {
    if i < max_per_wave {
        wave.push(item);
        i += 1;
    }
}
if work.len() > max_per_wave {
    log("Capped wave to " + max_per_wave.to_string() + " of " + work.len().to_string() + " failing demos");
}

if wave.len() == 0 {
    complete(#{
        summary: "All scored demos already at or above pass_score; nothing to rebuild.",
        pass_score: pass_score,
        baseline_ok: true,
    });
}

if dry_run == true {
    complete(#{
        summary: "dry_run: baseline + triage only",
        queue: wave,
        notes: triage.output.notes,
    });
}

// ---------------------------------------------------------------------------
// PHASE 3–5 — Rebuild waves with OpenCV re-verify + optional vision
// ---------------------------------------------------------------------------
let round = 0;
let history = [];

while round < max_rounds {
    round += 1;
    phase("Rebuild wave");
    log("Round " + round.to_string() + " — rebuilding " + wave.len().to_string() + " demos");

    let jobs = [];
    for item in wave {
        let p = "";
        p += "PIXEL-PERFECT REBUILD (exclusive ownership of one file).\n\n";
        p += "Target id: " + item.id + "\n";
        p += "Demo file to OVERWRITE: " + item.demo + "\n";
        p += "Inspiration image (MUST open with read_file as image): " + item.inspo + "\n";
        p += "Current OpenCV score: " + item.score.to_string() + " (priority " + item.priority + ")\n";
        p += "Why it failed: " + item.why + "\n\n";
        p += "CRITICAL PROCESS (this repo's lesson):\n";
        p += "1) read_file the inspo image FIRST and describe layout BEFORE coding (phones? desktop? grid?).\n";
        p += "2) Match COMPOSITION over inventing features. Dual-phone mockups stay dual-phone.\n";
        p += "3) Recreate as a single self-contained HTML file (inline CSS, optional CDN fonts).\n";
        p += "4) Do NOT claim pixel-perfect. Implement closest structural match to inspo.\n";
        p += "5) Do NOT edit other demos. Do NOT edit index.html unless paths change.\n";
        p += "6) Known LLM failure: washing out into generic glass cards; wrong framing; ignoring background scene.\n";
        p += "7) After write, re-read your HTML and check for incomplete tags.\n\n";
        p += "Return schema: id, demo_path, changed (bool), summary of what you matched from inspo.\n";

        jobs.push(#{
            prompt: p,
            label: "rebuild:" + item.id,
            capability_mode: "read-write",
            output_schema: rebuild_schema,
        });
    }

    let rebuilds = parallel(jobs);
    let changed_ids = [];
    let ri = 0;
    for r in rebuilds {
        if r != () && r.success && r.output != () && r.output.changed == true {
            changed_ids.push(r.output.id);
        }
        if r == () || r.success != true {
            log("rebuild slot failed for wave index " + ri.to_string());
        }
        ri += 1;
    }
    log("Changed demos this wave: " + changed_ids.len().to_string());

    // Re-verify OpenCV
    phase("Re-verify");
    let rev_prompt = "";
    rev_prompt += "Re-run the OpenCV pipeline after the rebuild wave.\n";
    rev_prompt += "1) python3 -m http.server 8765 --bind 127.0.0.1 in background\n";
    rev_prompt += "2) node tools/verify-inspo.mjs http://127.0.0.1:8765\n";
    rev_prompt += "3) stop the server\n";
    rev_prompt += "4) Read tools/verify-out/report.json\n";
    rev_prompt += "List scores for these ids only, with old priority context: ";
    rev_prompt += json_encode(wave);
    rev_prompt += "\nWrite tools/verify-out/ROUND-";
    rev_prompt += round.to_string();
    rev_prompt += ".md with a before/after table if possible.\n";
    rev_prompt += "Do not invent metrics. Quote report.json.\n";

    let reverify = agent(rev_prompt, #{
        label: "opencv-round-" + round.to_string(),
        capability_mode: "execute",
    });

    if reverify == () || reverify.success != true {
        pause("infra", "OpenCV re-verify failed on round " + round.to_string());
    }

    // Vision council — advisory only, must bind to OpenCV scores
    if skip_vision != true {
        phase("Vision council");
        let vjobs = [];
        for item in wave {
            let vp = "";
            vp += "You are an ADVISORY visual judge. OpenCV is ground truth.\n";
            vp += "Demo id: " + item.id + " path: " + item.demo + " inspo: " + item.inspo + "\n";
            vp += "1) Read tools/verify-out/report.json and find this id's score/ssim/hist/edge.\n";
            vp += "2) Read tools/verify-out/diffs/" + item.id + "_compare.jpg if present (inspo|demo|heat).\n";
            vp += "3) Read tools/verify-out/shots/" + item.id + "_demo.png if present.\n";
            vp += "4) Read the inspo image " + item.inspo + ".\n";
            vp += "5) List structural gaps only (layout, missing dual phones, wrong density).\n";
            vp += "Rules: You MUST set opencv_score from report.json. If you disagree with OpenCV, set agree_with_opencv=false and explain — do NOT invent a better score.\n";
            vp += "LLMs hallucinate polish; if evidence files are missing, say so and keep severity_gaps short.\n";
            vp += "hallucination_risk: low|medium|high based on whether you actually opened the images.\n";

            vjobs.push(#{
                prompt: vp,
                label: "vision:" + item.id,
                capability_mode: "read-only",
                output_schema: vision_schema,
            });
        }
        let visions = parallel(vjobs);
        let advice = [];
        for v in visions {
            if v != () && v.success && v.output != () {
                advice.push(v.output);
            }
        }
        history.push(#{
            round: round,
            vision: advice,
        });
    }

    // Rebuild next wave from latest report (triage again)
    let retriage_prompt = "";
    retriage_prompt += "Read tools/verify-out/report.json again after round ";
    retriage_prompt += round.to_string();
    retriage_prompt += ".\nQueue demos with score < ";
    retriage_prompt += pass_score.to_string();
    retriage_prompt += " worst-first, max ";
    retriage_prompt += max_per_wave.to_string();
    retriage_prompt += " items. Same schema. Empty queue if all pass.\n";

    let retriage = agent(retriage_prompt, #{
        label: "retriage-" + round.to_string(),
        capability_mode: "read-only",
        output_schema: triage_schema,
    });

    if retriage == () || retriage.success != true || retriage.output == () || retriage.output.queue == () {
        log("Retriage failed or empty — stopping loop");
        break;
    }

    wave = [];
    let j = 0;
    for item in retriage.output.queue {
        if j < max_per_wave {
            // optional only_ids filter
            if only_ids == () {
                wave.push(item);
                j += 1;
            } else {
                let keep = false;
                for id in only_ids {
                    if item.id == id { keep = true; }
                }
                if keep {
                    wave.push(item);
                    j += 1;
                }
            }
        }
    }

    history.push(#{
        round: round,
        remaining: wave.len(),
    });

    if wave.len() == 0 {
        log("All remaining demos meet pass_score after round " + round.to_string());
        break;
    }
}

// ---------------------------------------------------------------------------
// Final report
// ---------------------------------------------------------------------------
phase("Loop / report");
let report_prompt = "";
report_prompt += "Produce the final status report for pixel-perfect-loop.\n";
report_prompt += "Read tools/verify-out/report.json and any ROUND-*.md / BASELINE.md present.\n";
report_prompt += "Write tools/verify-out/FINAL.md with:\n";
report_prompt += "- Method: OpenCV ground truth + optional LLM vision advisory (why both)\n";
report_prompt += "- pass_score used: ";
report_prompt += pass_score.to_string();
report_prompt += "\n- Full ranked table from latest report.json\n";
report_prompt += "- Which demos still fail and recommended next actions\n";
report_prompt += "- Lessons: composition > palette; dual-phone framing; never self-grade\n";
report_prompt += "Do not invent scores.\n";

let final_agent = agent(report_prompt, #{
    label: "final-report",
    capability_mode: "read-write",
});

let summary = "pixel-perfect-loop finished " + max_rounds.to_string() + " max rounds; see tools/verify-out/FINAL.md and report.json";
if final_agent != () && final_agent.success {
    summary = "pixel-perfect-loop complete — OpenCV report at tools/verify-out/report.json / FINAL.md";
}

complete(#{
    summary: summary,
    pass_score: pass_score,
    max_rounds: max_rounds,
    history: history,
    report_path: "tools/verify-out/FINAL.md",
});
