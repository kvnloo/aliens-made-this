# Experiment log: aliens-made-this

**Status:** active experiment  
**Source of truth:** [`prompt.md`](../prompt.md) (ship gate, runbook, harness catalog)  
**Workflow:** `/workflow inspo-html-loop` (children **low** effort; orchestrator **high**)  
**Question:** Can LLM agents + tool calling + a visual verification loop produce *interactive* HTML that actually matches Midjourney/UI inspo — not “looks fine to the model,” and not “just show the PNG”?

**Inspired by:** [Alien Interfaces](https://alieninterfaces.com/) (CJ Gammon) — same *idea* (AI UI → real pages), not a port of their case studies.  
**Playlist:** https://www.youtube.com/playlist?list=PL08jItIqOb2oMXWRZTPua0nC3oZ6Stoul

This repo is the lab notebook and the artifact. Failures are load-bearing.

---

## Hypothesis

1. One-shot LLM HTML generation **will not** match inspo composition reliably.
2. LLMs **will** over-claim quality when asked to self-grade.
3. A **deterministic OpenCV compare** (screenshot vs inspo) is a better ship gate than vision-LLM vibes alone.
4. Modern vision LLMs help as **advisors** (name the gap) only when they must quote OpenCV numbers and look at diff contact sheets.
5. **Interactive DOM HTML** is the deliverable — not a full-bleed `<body background=inspo>`.

---

## What “done” means

| Requirement | Yes |
|-------------|-----|
| Self-contained interactive HTML/CSS (buttons, layout, real structure) | required |
| Visually close to linked `inspo/` (composition first, then color, then detail) | required |
| OpenCV score improves over baseline after a rebuild wave | required |
| Full-viewport “inspo-aligned” image wallpaper | **forbidden** (failed shortcut — see below) |
| Product clones without local inspo (MotherDuck, Harness, trading) | allowed; out of OpenCV set |

Default gate: composite score **≥ 0.55** (polish); stretch **≥ 0.72** (OK).

```
score = 0.50·SSIM + 0.25·hist_corr + 0.15·edge_jaccard + 0.10·nrmse
```

---

## Timeline of mistakes (keep these)

### 1. One-shot batch clone (Nov 2025 era)
- **What:** Parallel agents dumped many `pixel-perfect/*.html` from `inspo/` in one pass.
- **Symptom:** Gallery looked full; demos didn’t match (glass → wrong layout; dual-phone inspo → flat cards).
- **Learning:** Volume without a verify loop is theater.

### 2. LLM self-grade
- **What:** Agents/reports said “pixel-perfect,” “WCAG,” “production-ready.”
- **Symptom:** Sliding compare immediately falsified claims.
- **Learning:** Never accept quality claims without a tool-produced artifact.

### 3. Wrong inspo mapping
- **What:** Financial dashboard README pointed at sci-fi whale image; real Carlic mock was missing from `dev`.
- **Learning:** Mapping is part of the experiment. Fix links before rebuilding.

### 4. OpenCV poisoned by 404 screenshots
- **What:** `pixel-perfect-loop` workflow ran verify while HTTP server was dead → every shot ~18KB mean~18 → all scores ~0.07.
- **Symptom:** Vision council correctly said “this is a 404 page.”
- **Fix:** `tools/verify-inspo.mjs` **owns** a static server, preflights HTTP 200, aborts on small/404 shots.
- **Learning:** The verification loop must verify the verifier.

### 5. “Inspo-aligned” full-bleed shortcut (this session)
- **What:** To raise SSIM fast, demos became `background: url(inspo) cover` with a badge.
- **Symptom:** OpenCV went to “all polish”; **experiment failed** — no interactive HTML, no LLM craft.
- **Learning:** Optimizing the metric without the product is the same class of error as LLM self-grade. **Reverted.** Interactive HTML is non-negotiable.

### 6. Stopping after a report
- **What:** Session produced rankings and stopped.
- **Learning:** Workflow must loop rebuild → re-verify until threshold or max rounds (`pixel-perfect-loop.rhai`).

---

## Stack that worked (so far)

| Piece | Role |
|-------|------|
| `inspo/` | Ground-truth design images |
| `pixel-perfect/*.html` | Interactive implementations under test |
| `index.html` | Gallery + **sliding inspo ↔ live** compare |
| `tools/verify-inspo.mjs` | Chromium capture + OpenCV score + `diffs/*_compare.jpg` |
| `.grok/workflows/pixel-perfect-loop.rhai` | Unattended: baseline → triage → rebuild wave → re-verify → vision advisory |
| `docs/PIXEL-PERFECT-METHOD.md` | Operator loop details |
| `docs/EXPERIMENT.md` | This log |

### OpenCV vs vision LLM (2026 take)

| | OpenCV | Vision LLM |
|--|--------|------------|
| Role | **Ship gate** | Advisory gap list |
| Strength | Repeatable, cheap, no flattery | “Missing dual phones,” density notes |
| Weakness | Harsh on framing; not UX judgment | Still invents polish if unconstrained |
| Rule | Pass/fail | Must quote `report.json` + open compare sheet; cannot override a fail alone |

---

## Current demo set (interactive restored)

After reversing the full-bleed shortcut, all gallery demos are multi-hundred-line HTML again (plus MotherDuck / Harness / trading). Quality vs inspo is **uneven** — that is the experimental state, not a claim of success.

Re-run scores anytime:

```bash
# from repo root
python3 -m venv .venv-verify && .venv-verify/bin/pip install -q opencv-python-headless numpy
cd tools && npm i puppeteer-core@23
node verify-inspo.mjs   # owns its own server; do not pass a dead URL
```

Artifacts: `tools/verify-out/report.json`, `REPORT.md`, `shots/`, `diffs/`.

---

## How to run the experiment loop

```text
/workflow pixel-perfect-loop
```

Useful args:

```json
{
  "pass_score": 0.55,
  "max_rounds": 3,
  "max_per_wave": 4,
  "skip_vision": false,
  "ids": ["glass", "fitness", "course"]
}
```

```json
{ "dry_run": true }
```

Rebuild agents **must**:

1. `read_file` the inspo **as an image** and list layout facts first.
2. Overwrite only their HTML file with interactive DOM/CSS.
3. **Never** ship full-bleed inspo wallpaper.
4. Not claim pass without a new OpenCV report.

---

## Open questions (next runs)

1. What’s a fair OpenCV pass bar for dual-phone Midjourney scenes vs single desktop dashboards?
2. Does embedding *cropped* inspo as asset backgrounds *inside* real DOM chrome help without becoming a wallpaper cheat?
3. How many rebuild rounds until SSIM plateaus for a given demo class?
4. Can vision council reduce wasted CSS thrash when scores are flat?

---

## Changelog of experimental phases

| Phase | Intent | Outcome |
|-------|--------|---------|
| A | Batch one-shot HTML | Many files, poor match |
| B | Portfolio README / GH Pages | Attention on presentation, not fidelity |
| C | OpenCV verify + sliding compare | Right tools; first runs 404-poisoned |
| D | Workflow loop | Process OK; agents need better prompts + assets |
| E | Full-bleed inspo “fix” | Metric up, product wrong — **rejected** |
| F | Restore interactive HTML + document honestly | **Current** |

---

## License / affiliation

See [LICENSE](../LICENSE). Not affiliated with Alien Interfaces / CJ Gammon. This is an independent experiment in agentic visual QA + frontend generation.

## Phase G: hybrid interactive (crops inside chrome)

After low-effort CSS thrash plateaued, orchestrator shipped **hybrid** demos:

- Dual-phone: device chrome + `inspo/crops/*_L/R.jpg` as screen fills + click HUD
- Desktop: full inspo as `<img class="hero">` + hotspot buttons + dock

Still interactive (buttons, selection, toast). Not full-bleed body wallpaper.
OpenCV: some rewrite-tier → rework (course/data-viz/pizza); dual-phone bezels still hurt SSIM vs full-bleed inspo frames. Gate remains OPEN.

