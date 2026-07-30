// inspo → interactive HTML quality loop
// Source of truth: prompt.md (agents must read_file it)
// Children: LOW effort (TOKEN-MIN). Orchestrator outside this script: high effort.
//
// Launch:
//   /effort high
//   /workflow inspo-html-loop {"start_round":1,"rounds":6,"pass_score":0.55,"max_per_wave":4}
//   agent_budget: 128–256
//
// Watch: /workflows

let meta = #{
    name: "inspo-html-loop",
    description: "Interactive HTML vs inspo: OpenCV gate + low-effort rebuild waves; reads prompt.md",
    when_to_use: "Execute aliens-made-this/prompt.md until interactive demos match inspo under OpenCV",
    phases: [
        #{ title: "Bootstrap", detail: "read prompt.md + residuals; OpenCV baseline" },
        #{ title: "Round", detail: "low-effort impl wave → OpenCV → optional critics" },
        #{ title: "Report", detail: "PROMPT-TRUTH + residuals; gate open/closed" },
    ],
};

let rebuild_schema = #{
    "type": "object",
    "required": ["id", "demo_path", "changed", "layout_facts", "summary"],
    "properties": #{
        "id": #{ "type": "string" },
        "demo_path": #{ "type": "string" },
        "changed": #{ "type": "boolean" },
        "layout_facts": #{ "type": "array", "items": #{ "type": "string" }, "maxItems": 8 },
        "summary": #{ "type": "string" },
    },
};

let critic_schema = #{
    "type": "object",
    "required": ["id", "opencv_score", "agree_with_opencv", "structural_gaps", "ship_this_id"],
    "properties": #{
        "id": #{ "type": "string" },
        "opencv_score": #{ "type": "number" },
        "agree_with_opencv": #{ "type": "boolean" },
        "structural_gaps": #{ "type": "array", "items": #{ "type": "string" }, "maxItems": 6 },
        "ship_this_id": #{ "type": "boolean" },
    },
};

let triage_schema = #{
    "type": "object",
    "required": ["queue", "pass_count", "fail_count", "notes"],
    "properties": #{
        "queue": #{
            "type": "array",
            "maxItems": 12,
            "items": #{
                "type": "object",
                "required": ["id", "demo", "inspo", "score"],
                "properties": #{
                    "id": #{ "type": "string" },
                    "demo": #{ "type": "string" },
                    "inspo": #{ "type": "string" },
                    "score": #{ "type": "number" },
                },
            },
        },
        "pass_count": #{ "type": "number" },
        "fail_count": #{ "type": "number" },
        "notes": #{ "type": "string" },
    },
};

// --- args ---
let max_rounds = 6;
let start_round = 1;
let pass_score = 0.55;
let max_per_wave = 4;
let skip_vision = false;
let only_ids = ();

if args != () {
    if args.rounds != () { max_rounds = args.rounds; }
    if args.start_round != () { start_round = args.start_round; }
    if args.pass_score != () { pass_score = args.pass_score; }
    if args.max_per_wave != () { max_per_wave = args.max_per_wave; }
    if args.skip_vision == true { skip_vision = true; }
    if args.ids != () { only_ids = args.ids; }
}
if max_rounds < 1 { max_rounds = 1; }
if max_rounds > 12 { max_rounds = 12; }
if max_per_wave < 1 { max_per_wave = 1; }
if max_per_wave > 6 { max_per_wave = 6; }

// Shared low-effort preamble for EVERY child
let low = "";
low += "REASONING EFFORT: low. TOKEN-MIN. Tools > talk. Schema at end.\n";
low += "You are a worker agent — not the orchestrator. Do not plan multi-demo strategies.\n";

let law = "";
law += "LAW (from prompt.md — also read_file prompt.md ship-gate + forbidden):\n";
law += "- Interactive DOM HTML only under pixel-perfect/.\n";
law += "- FORBIDDEN: full-bleed body background wallpaper of inspo (inspo-aligned stubs).\n";
law += "- OpenCV tools/verify-out/report.json is ground truth; never invent scores.\n";
law += "- verify: node tools/verify-inspo.mjs  with NO base URL (owns server).\n";
law += "- Dual-phone inspo ⇒ dual phones; match composition before polish.\n";

// ---------------------------------------------------------------------------
phase("Bootstrap");
log("inspo-html-loop: rounds=" + max_rounds.to_string() + " pass_score=" + pass_score.to_string() + " children=LOW effort");

let boot_p = "";
boot_p += low;
boot_p += law;
boot_p += "BOOTSTRAP (low effort).\n";
boot_p += "1) read_file prompt.md (ship gate + forbidden + demo map).\n";
boot_p += "2) read_file docs/LOOP-RESIDUALS.md and docs/PROMPT-TRUTH.md.\n";
boot_p += "3) Ensure .venv-verify has opencv-python-headless; tools has puppeteer-core.\n";
boot_p += "4) Run: node tools/verify-inspo.mjs\n";
boot_p += "5) If it fails on 404/small shots, stop and report infra — do not fake scores.\n";
boot_p += "6) Quote fail_count vs pass_score from report.json in a short note.\n";
boot_p += "7) Refresh docs/LOOP-RESIDUALS.md top P0/P1 from real scores (worst first).\n";

let boot = agent(boot_p, #{
    label: "opencv-bootstrap",
    capability_mode: "execute",
});

if boot == () || boot.success != true {
    pause("infra", "Bootstrap/OpenCV failed. Fix tools/verify-inspo.mjs deps, then resume.");
}

let triage_p = "";
triage_p += low;
triage_p += "read_file tools/verify-out/report.json (required).\n";
triage_p += "Build queue of ids with score < ";
triage_p += pass_score.to_string();
triage_p += " worst-first, max 12. Fields: id, demo, inspo, score from report + prompt.md map.\n";
triage_p += "pass_count / fail_count vs threshold. notes: one line systemic issue.\n";
triage_p += "Filter to only_ids if non-empty: ";
triage_p += json_encode(only_ids);
triage_p += "\nEmpty queue if all pass.\n";

let triage0 = agent(triage_p, #{
    label: "triage-0",
    capability_mode: "read-only",
    output_schema: triage_schema,
});

if triage0 == () || triage0.success != true || triage0.output == () {
    pause("verification", "Triage failed without report.json evidence.");
}

if triage0.output.fail_count == 0 || triage0.output.queue == () || triage0.output.queue.len() == 0 {
    // write honesty and complete ship
    let done_p = "";
    done_p += low;
    done_p += "All demos at pass_score. Update docs/PROMPT-TRUTH.md ship_gate_met=true with evidence paths from report.json. Short.\n";
    agent(done_p, #{ label: "truth-yes", capability_mode: "read-write" });
    complete(#{
        summary: "Ship gate CLOSED — all queued demos >= pass_score",
        ship: true,
        pass_score: pass_score,
    });
}

// ---------------------------------------------------------------------------
let round = start_round;
let end_round = start_round + max_rounds - 1;
let last_label = "none";
let wave = [];
// seed wave from triage
let qi = 0;
for item in triage0.output.queue {
    if qi < max_per_wave {
        wave.push(item);
        qi += 1;
    }
}

while round <= end_round {
    phase("Round");
    let label = "r" + round.to_string();
    last_label = label;
    log("round " + label + " wave_size=" + wave.len().to_string());

    if wave.len() == 0 {
        log("empty wave — stop rounds");
        break;
    }

    // --- low-effort parallel rebuilds ---
    let jobs = [];
    for item in wave {
        let p = "";
        p += low;
        p += law;
        p += "read_file prompt.md forbidden + ship gate (skim).\n";
        p += "REBUILD ONE DEMO. id=" + item.id + " file=" + item.demo + " inspo=" + item.inspo + "\n";
        p += "OpenCV score now=" + item.score.to_string() + "\n";
        p += "STEPS:\n";
        p += "1) read_file inspo path AS IMAGE. layout_facts = concrete list (phone count, bg, sections).\n";
        p += "2) OVERWRITE only that demo HTML with interactive DOM/CSS matching composition.\n";
        p += "3) Optional: <img src=crop> inside chrome — never body wallpaper only.\n";
        p += "4) changed=true if you wrote the file. summary = what matched.\n";
        jobs.push(#{
            prompt: p,
            label: "impl:" + item.id + ":" + label,
            capability_mode: "read-write",
            output_schema: rebuild_schema,
        });
    }
    let impls = parallel(jobs);
    let n_ok = 0;
    for r in impls {
        if r != () && r.success && r.output != () && r.output.changed == true {
            n_ok += 1;
        }
    }
    log("impls changed=" + n_ok.to_string());

    // --- OpenCV re-verify (low effort execute) ---
    let ver_p = "";
    ver_p += low;
    ver_p += law;
    ver_p += "Run node tools/verify-inspo.mjs (no URL). Then read report.json.\n";
    ver_p += "Write tools/verify-out/ROUND-" + label + ".md with scores for wave ids only.\n";
    ver_p += "Wave: ";
    ver_p += json_encode(wave);
    ver_p += "\n";

    let ver = agent(ver_p, #{
        label: "opencv:" + label,
        capability_mode: "execute",
    });
    if ver == () || ver.success != true {
        pause("infra", "OpenCV failed on " + label);
    }

    // --- optional low-effort vision critics ---
    if skip_vision != true {
        let cjobs = [];
        for item in wave {
            let cp = "";
            cp += low;
            cp += "ADVISORY critic. id=" + item.id + "\n";
            cp += "1) report.json score for id\n";
            cp += "2) read_file tools/verify-out/diffs/" + item.id + "_compare.jpg if exists\n";
            cp += "3) structural_gaps only; ship_this_id true only if score>=";
            cp += pass_score.to_string();
            cp += " AND composition matches\n";
            cp += "agree_with_opencv must be true unless you prove shot is corrupt.\n";
            cjobs.push(#{
                prompt: cp,
                label: "crit:" + item.id + ":" + label,
                capability_mode: "read-only",
                output_schema: critic_schema,
            });
        }
        parallel(cjobs);
    }

    // --- retriage for next wave ---
    let rt = "";
    rt += low;
    rt += "read_file tools/verify-out/report.json.\n";
    rt += "Queue score < ";
    rt += pass_score.to_string();
    rt += " worst-first max ";
    rt += max_per_wave.to_string();
    rt += ". Filter only_ids=";
    rt += json_encode(only_ids);
    rt += ". pass_count/fail_count/notes.\n";

    let tri = agent(rt, #{
        label: "triage:" + label,
        capability_mode: "read-only",
        output_schema: triage_schema,
    });

    if tri == () || tri.success != true || tri.output == () {
        log("retriage failed — end rounds");
        break;
    }

    if tri.output.fail_count == 0 || tri.output.queue == () || tri.output.queue.len() == 0 {
        let close_p = "";
        close_p += low;
        close_p += "Update docs/PROMPT-TRUTH.md ship_gate_met=true; quote report.json. Update LOOP-RESIDUALS clear P0.\n";
        agent(close_p, #{ label: "truth-close", capability_mode: "read-write" });
        complete(#{
            summary: "Ship gate CLOSED after " + label,
            ship: true,
            last_round: label,
            pass_score: pass_score,
        });
    }

    wave = [];
    let j = 0;
    for item in tri.output.queue {
        if j < max_per_wave {
            wave.push(item);
            j += 1;
        }
    }

    // residuals refresh
    let res_p = "";
    res_p += low;
    res_p += "Update docs/LOOP-RESIDUALS.md from report.json fails. Keep PROMPT-TRUTH ship_gate_met=false with reason.\n";
    agent(res_p, #{ label: "residuals:" + label, capability_mode: "read-write" });

    round += 1;
}

// ---------------------------------------------------------------------------
phase("Report");
let rep = "";
rep += low;
rep += "read_file tools/verify-out/report.json + docs/PROMPT-TRUTH.md.\n";
rep += "Write docs/PROMPT-TRUTH.md: ship_gate_met=false if any score < ";
rep += pass_score.to_string();
rep += "; list failing ids; next_action relaunch inspo-html-loop start_round>\n";
rep += last_label;
rep += "\nQuote real numbers only.\n";

agent(rep, #{ label: "final-truth", capability_mode: "read-write" });

complete(#{
    summary: "Gate still OPEN after rounds — relaunch inspo-html-loop with higher start_round. See PROMPT-TRUTH.md",
    ship: false,
    last_round: last_label,
    pass_score: pass_score,
    relaunch_hint: "inspo-html-loop {\"start_round\": next, \"rounds\": 8, \"pass_score\": 0.55}",
});
