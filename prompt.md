# The prompt — aliens-made-this

This is the **source of truth** for the **inspo → interactive HTML** experiment and
the **Grok-native harness** that runs it. Anyone cloning this repo should recreate
the loop from this file + the paths it names — without tribal chat knowledge.

> **Important (Grok vs Claude):** Claude Code “ultracode” auto-spins dynamic
> workflows. **Grok does not.** A workflow only follows text that is **in the
> Rhai agent prompts** or that those agents are told to **`read_file`**. Editing
> `prompt.md` alone does **not** reprogram a run that already started; **relaunch**
> the workflow after edits. Orchestrator sessions use **high** effort; **every
> sub-agent / workflow child must use low effort** (TOKEN-MIN, tools > talk).

---

## Creative brief (the bar)

```
Experiment: prove that LLM agents + tool calling + a visual verification loop
can turn design inspiration images into interactive HTML/CSS demos that
actually look like the inspo — composition first, then color, then detail.

This is NOT a portfolio of finished work. It is a lab. Failures are data.

Inspired by Alien Interfaces (https://alieninterfaces.com/) and CJ Gammon’s
YouTube series (playlist PL08jItIqOb2oMXWRZTPua0nC3oZ6Stoul): same spirit
(AI UI → real pages), NOT a port of their case studies.

Deliverable for each entry in the gallery:
  • Self-contained interactive HTML under pixel-perfect/<id>.html
  • Real DOM structure (layout, cards, buttons, navigation chrome) — not a
    full-bleed wallpaper of the inspo PNG
  • Visually close to the linked file in inspo/ when viewed side-by-side
  • Measurable via OpenCV capture (tools/verify-inspo.mjs) — ship gate

Live surface: index.html (GH Pages) with sliding inspo ↔ live compare.
Document everything: docs/EXPERIMENT.md, docs/LOOP-RESIDUALS.md,
docs/PROMPT-TRUTH.md, tools/verify-out/*.

Fan out low-effort sub-agents: one owner per demo file per wave. Separate
low-effort critic/OpenCV runner. Orchestrator (human or high-effort parent)
only schedules loops, never soft-stops while the gate is OPEN.
```

### Ship gate (non-negotiable)

Work for a demo is **not done** until **all** are true:

1. **Interactive HTML** — multi-section DOM; hover/click affordances where the
   inspo implies UI chrome. File is **not** a stub (`inspo-aligned` wallpaper,
   &lt;50 lines of body-background-only).
2. **OpenCV capture OK** — `node tools/verify-inspo.mjs` (no base URL — script
   owns server) produces non-404 shots for that id; shot size &gt; 40KB.
3. **Score gate** — composite score in `tools/verify-out/report.json` for that
   id **≥ pass_score** (default **0.55** polish; stretch **0.72** OK):
   ```
   score = 0.50·SSIM + 0.25·hist_corr + 0.15·edge_jaccard + 0.10·nrmse
   ```
4. **Composition match** — dual-phone inspo ⇒ dual phones; desktop bento ⇒ bento;
   not “generic glass cards.”
5. **Diff sheet** — `tools/verify-out/diffs/<id>_compare.jpg` exists (inspo | demo | heat).
6. **Honesty** — `docs/PROMPT-TRUTH.md` does not claim YES without report.json evidence.
7. Verdict **ship** for the wave only if every queued id meets the gate or is
   explicitly deferred in LOOP-RESIDUALS with a reason.

Until then: implement → OpenCV → (optional low-effort vision advisory) → fix → **loop**.  
Partial polish while gate OPEN is failure mode, not progress theater.

**Gate OPEN ⇒ continue.** A finished workflow run with remaining scores &lt; pass_score
is **not** experiment complete. Immediately relaunch:

```text
/workflow inspo-html-loop {"start_round":N,"rounds":8,"pass_score":0.55,"max_per_wave":4}
```

with `N = last_round + 1` and `agent_budget` 128–256.  
Orchestrator effort: **high**. Child agents: **low** only.

---

## Forbidden (learned the hard way)

| Forbidden | Why |
|-----------|-----|
| Full-bleed `body { background: url(inspo) cover }` as the “demo” | Games SSIM; kills the experiment |
| Claiming “pixel-perfect” without `report.json` | LLM self-grade |
| OpenCV against a dead URL / 404 shots | Mass fake ~0.07 scores |
| Soft-stop after a ranking report | Never closes the gate |
| One agent editing many demos in one turn | Merge thrash; lose ownership |
| High-effort sub-agents | Token waste; orchestrator owns hard thinking |

---

## Claude “ultracode” vs Grok harness

| Claude | Grok map here |
|--------|----------------|
| `/effort ultracode` auto workflows | **`.grok/workflows/inspo-html-loop.rhai`** + this file |
| Keyword magic | Explicit `/workflow inspo-html-loop …` |
| xhigh effort | Parent: `/effort high`. Children: **low** (personas + TOKEN-MIN prompts) |

**Bottom line:** Launch the workflow. Effort alone only thinks harder.

---

## Recreate from a clean clone

```bash
git clone <this-repo> && cd aliens-made-this
# Grok Build TUI with workflows + subagents
python3 -m venv .venv-verify && .venv-verify/bin/pip install -q opencv-python-headless numpy
cd tools && npm i puppeteer-core@23 && cd ..
```

```text
/effort high
/workflow inspo-html-loop {"rounds":6,"start_round":1,"pass_score":0.55,"max_per_wave":4}
```

Watch: `/workflows`. Stop: `/workflow stop inspo-html-loop`.

Manual OpenCV only:

```bash
cd tools && node verify-inspo.mjs
# → tools/verify-out/REPORT.md  (script owns HTTP server)
```

---

## Harness catalog

| Artifact | Path |
|----------|------|
| **Master prompt** | `prompt.md` (this file) |
| **Quality workflow** | `.grok/workflows/inspo-html-loop.rhai` |
| **Legacy loop** | `.grok/workflows/pixel-perfect-loop.rhai` (prefer inspo-html-loop) |
| **Personas** | `.grok/personas/cheap-impl.toml`, `cheap-opencv.toml`, `cheap-critic.toml` |
| **Experiment log** | `docs/EXPERIMENT.md` |
| **Method** | `docs/PIXEL-PERFECT-METHOD.md` |
| **Residuals** | `docs/LOOP-RESIDUALS.md` |
| **Honesty** | `docs/PROMPT-TRUTH.md` |
| **OpenCV tool** | `tools/verify-inspo.mjs` |
| **Gallery + slider** | `index.html` |
| **Demos** | `pixel-perfect/*.html` |
| **Inspo** | `inspo/*` |
| **Scores** | `tools/verify-out/report.json` |

### Workflow ↔ prompt coupling

| Layer | Loads `prompt.md`? |
|-------|--------------------|
| Human `@prompt.md` | Yes |
| `/goal … prompt.md` | Agent must `read_file` |
| `inspo-html-loop` | **Must** `read_file prompt.md` ship-gate + forbidden sections every bootstrap + every rebuild prompt |
| Mid-flight edit | Does **not** change a running run — **relaunch** |

---

## Per-round contract

1. `read_file prompt.md` (ship gate + forbidden).
2. `read_file docs/LOOP-RESIDUALS.md` + latest `tools/verify-out/report.json`.
3. **OpenCV baseline** if report missing/stale: `node tools/verify-inspo.mjs`.
4. Queue ids with score &lt; pass_score (worst first), max `max_per_wave`.
5. **Parallel low-effort impl** — one agent per id, exclusive file ownership:
   - `read_file` inspo **as image** first; list layout facts.
   - Rewrite interactive HTML only for that demo.
   - No wallpaper stubs.
6. **OpenCV re-verify** (low-effort execute agent): `node tools/verify-inspo.mjs`.
7. Optional **low-effort vision critics** on `diffs/<id>_compare.jpg` — advisory only; must quote OpenCV score.
8. Refresh `LOOP-RESIDUALS.md` + `PROMPT-TRUTH.md`.
9. If gate still OPEN → next round or relaunch with higher `start_round`.

---

## Demo ownership map (inspo-linked)

| id | demo | inspo |
|----|------|--------|
| dashboard | pixel-perfect/dashboard.html | inspo/original-a16c4c2967229fa52683443ee0c26903.webp |
| dashboard-uied | pixel-perfect/dashboard_uied.html | same |
| fishing-app | pixel-perfect/fishing-app.html | same |
| glass | pixel-perfect/01.html | inspo/01.jpg |
| nature-mobile | pixel-perfect/nature-mobile-ui.html | inspo/02.jpg |
| 3d-mobile | pixel-perfect/3d-mobile-ui.html | inspo/03.jpg |
| data-viz | pixel-perfect/data-viz-dashboard.html | inspo/Fjm_ePFVEAIb2zq.jpeg |
| ocean | pixel-perfect/ocean-dashboard.html | inspo/Fjm_dssVIAAq4T2.jpg |
| pasta | pixel-perfect/pasta-dashboard.html | inspo/FjtjX_saEAAeA3u.jpeg |
| travel | pixel-perfect/travel-booking-app.html | inspo/FjtjXt6aMAAKt_U.jpeg |
| dark-game | pixel-perfect/dark-game-ui.html | inspo/FjtjYmaaAAAcDNC.jpeg |
| fitness | pixel-perfect/fitness-health-app.html | inspo/Francesco.Svara_…png |
| abhigyan | pixel-perfect/abhigyan-mobile-app.html | inspo/AbhigyanPatwari_…png |
| pizza | pixel-perfect/pizza-food-app.html | inspo/1_lKE4lwy3QcSqDh8-CBYijg.png |
| ux-pizza | pixel-perfect/ux-midjourney-app.html | inspo/UX-Design-Midjourney-008-980x980.jpg |
| boahat | pixel-perfect/finance-dashboard.html | inspo/original-4e145bbd4a9682e9bbf3129051205edc.webp |
| isometric | pixel-perfect/isometric-landing-page.html | inspo/Lookasz_….png |
| 3d-landing | pixel-perfect/3d-landing-page.html | inspo/jslowsky_….png |
| course | pixel-perfect/online-course-website.html | inspo/Ds_Beautiful_….png |

Out of OpenCV set (product / no local inspo): motherduck, harness, trading.

---

## How to run on Grok

### Option A — Workflow (preferred)

```text
/effort high
@prompt.md
/workflow inspo-html-loop {"rounds":8,"start_round":1,"pass_score":0.55,"max_per_wave":4}
```

`agent_budget` **128–256**. Children are low-effort by prompt + personas.

### Option B — Goal

```text
/effort high
/goal Execute aliens-made-this/prompt.md until OpenCV pass_score for all
  inspo-linked demos. Interactive HTML only. Do not soft-stop. Relaunch
  inspo-html-loop when a run completes with gate OPEN.
```

### Does not work

- Typing `ultracode` on Grok  
- High-effort sub-agents for every rebuild  
- Wallpaper stubs to “fix” SSIM  
- Soft-stop when `ship: false` / residual scores &lt; pass_score  

---

## One-liner (new session)

```text
/effort high
@prompt.md — run inspo-html-loop until interactive HTML demos match inspo
under OpenCV gate. Low-effort children only. Do not soft-stop.
```
