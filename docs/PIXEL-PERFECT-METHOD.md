# Pixel-perfect method (aliens-made-this)

How this repo should rebuild demos so we do not repeat the “looks fine to the LLM, nothing like the inspo” failure mode.

## Why this repo exists

Inspired by [Alien Interfaces](https://alieninterfaces.com/) (similar *workflow*, not their case studies): AI UI inspo → real HTML. The showcase only works if demos actually resemble `inspo/`.

## Failure modes we already hit

| Failure | What happened | Guard |
|--------|----------------|--------|
| One-shot batch generation | 15+ demos landed without composition match | Always open inspo image *before* coding; dual-phone stays dual-phone |
| LLM self-grade | Agents declare “pixel-perfect” with no evidence | **OpenCV scores are ground truth** |
| Wrong reference image | Financial dashboard linked to whale HUD | Mapping table in README + gallery `PROJECTS` |
| 404 screenshots | Verify server died → all SSIM noise | Check shot mean brightness / file size before scoring |
| Framing mismatch | Inspo is “phones on a desk”; demo is full-bleed | Prefer matching *scene composition* in HTML (two phones, orange split bg, etc.) |
| Unbounded agent “done” | Session stops after a report | Workflow loops: baseline → rebuild wave → re-verify until threshold |

## Ideal loop (2026)

```
┌─────────────────────────────────────────────────────────┐
│  1. OpenCV baseline (deterministic)                     │
│     capture HTML → SSIM/hist/edge vs inspo → report.json│
└───────────────────────┬─────────────────────────────────┘
                        ▼
┌─────────────────────────────────────────────────────────┐
│  2. Triage (scripted)                                   │
│     queue = scores < pass_score, worst first            │
└───────────────────────┬─────────────────────────────────┘
                        ▼
┌─────────────────────────────────────────────────────────┐
│  3. Rebuild wave (LLM agents, 1 demo each)              │
│     must read inspo image; exclusive file ownership     │
└───────────────────────┬─────────────────────────────────┘
                        ▼
┌─────────────────────────────────────────────────────────┐
│  4. OpenCV re-verify (required)                         │
│     never accept agent claims without new report.json   │
└───────────────────────┬─────────────────────────────────┘
                        ▼
┌─────────────────────────────────────────────────────────┐
│  5. Vision council (optional, advisory only)            │
│     LLM may describe gaps; must quote OpenCV numbers    │
│     if disagreement → side with OpenCV until proven     │
└───────────────────────┬─────────────────────────────────┘
                        ▼
              remaining fail? ──yes──► 3
                    │ no
                    ▼
                 FINAL.md
```

### OpenCV vs modern vision LLMs

| | OpenCV composite | Vision LLM |
|--|------------------|------------|
| Role | **Ground truth gate** | Advisory gap list |
| Strength | Repeatable, cheap, no flattery | Semantics (“missing dual phones”) |
| Weakness | Harsh on framing/art; not UX judgment | Still hallucinates polish; non-deterministic |
| Ship rule | Score ≥ `pass_score` (default **0.55**) | Cannot override a fail alone |

**Conclusion:** LLM vision improved, but for *this* repo the failure mode was over-trusting models. Keep OpenCV as the pass/fail gate. Use vision only to turn a low score into a concrete fix list *after* reading `diffs/*_compare.jpg`.

### Score (tools/verify-inspo.mjs)

```
score = 0.50·SSIM + 0.25·hist_corr + 0.15·edge_jaccard + 0.10·nrmse
```

| Score | Label |
|------:|-------|
| ≥ 0.72 | ok |
| 0.55–0.72 | polish |
| 0.40–0.55 | rework |
| < 0.40 | rewrite |

## Workflow entrypoint

```bash
# smoke check
# (via Grok) workflow validate pixel-perfect-loop

# dry run: baseline + triage only
# args: { "dry_run": true }

# full loop (example)
# args: {
#   "pass_score": 0.55,
#   "max_rounds": 3,
#   "max_per_wave": 4,
#   "skip_vision": false
# }

# focus subset
# args: { "ids": ["ux-pizza", "course", "ocean"], "max_rounds": 2 }
```

Saved as: `.grok/workflows/pixel-perfect-loop.rhai`

Manual one-shot:

```bash
python3 -m venv .venv-verify && .venv-verify/bin/pip install -q opencv-python-headless numpy
cd tools && npm i puppeteer-core@23
python3 -m http.server 8765 --bind 127.0.0.1 &
node tools/verify-inspo.mjs http://127.0.0.1:8765
```

## Agent prompt skeleton (rebuild)

1. `read_file` the inspo **as an image** and list layout facts (device count, bg, sections).
2. Rewrite only `pixel-perfect/<file>.html` as self-contained HTML/CSS.
3. Match composition first; then color; then micro-detail.
4. Do not edit other demos; do not claim pass without OpenCV.

## Out of scope for OpenCV

`motherduck`, `harness`, `trading` — no local inspo; product-inspired. Judge those with human/sliding compare only.

## Forbidden shortcut: full-bleed inspo wallpaper

We tried raising SSIM by setting `body { background: url(inspo) cover }` with an
`inspo-aligned` badge. OpenCV scores jumped; **the experiment failed** — no
interactive HTML, no craft, metric gaming.

**Rule:** demos must be interactive DOM. Optional: crop inspo *into* real chrome
as a hero image asset *inside* a layout — never replace the layout with wallpaper.

See [EXPERIMENT.md](./EXPERIMENT.md) phase E.
