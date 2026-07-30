# PROMPT-TRUTH

Honesty log for the ship gate. **Never invent YES.**

| Field | Value |
|-------|--------|
| last_updated | 2026-07-30 (from tools/verify-out/report.json) |
| pass_score | 0.55 |
| ship_gate_met | **false** |
| reason | 16/19 demos score &lt; 0.55; only 3 pass. Failing ids: data-viz (0.3075), course (0.3762), abhigyan (0.3948), pizza (0.3986), ocean (0.4643), nature-mobile (0.4645), boahat (0.4673), fitness (0.471), isometric (0.4756), glass (0.4942), 3d-mobile (0.4984), ux-pizza (0.502), 3d-landing (0.5181), pasta (0.5186), travel (0.5429), dark-game (0.5431). Passing: dashboard (0.5999), fishing-app (0.6285), dashboard-uied (0.6445). Worst: data-viz 0.3075. Interactive HTML shape OK; OpenCV fidelity gate not met. |
| evidence | tools/verify-out/report.json |
| wallpaper_stubs_present | **false** (reverted) |
| next_action | Relaunch `/workflow inspo-html-loop` with `start_round` &gt; r6; P0 rewrite: data-viz, course, abhigyan, pizza; then rework queue until all scores ≥ 0.55 or residuals explicitly deferred |

## Failing ids (score &lt; 0.55)

| id | score | grade | need |
|----|-------|-------|------|
| data-viz | 0.3075 | D/F | rewrite |
| course | 0.3762 | D/F | rewrite |
| abhigyan | 0.3948 | D/F | rewrite |
| pizza | 0.3986 | D/F | rewrite |
| ocean | 0.4643 | C | rework |
| nature-mobile | 0.4645 | C | rework |
| boahat | 0.4673 | C | rework |
| fitness | 0.471 | C | rework |
| isometric | 0.4756 | C | rework |
| glass | 0.4942 | C | rework |
| 3d-mobile | 0.4984 | C | rework |
| ux-pizza | 0.502 | C | rework |
| 3d-landing | 0.5181 | C | rework |
| pasta | 0.5186 | C | rework |
| travel | 0.5429 | C | rework |
| dark-game | 0.5431 | C | rework |

## Passing ids (score ≥ 0.55)

| id | score | grade | need |
|----|-------|-------|------|
| dashboard | 0.5999 | B | polish |
| fishing-app | 0.6285 | B | polish |
| dashboard-uied | 0.6445 | B | polish |

## Gate history

| When | ship_gate_met | Note |
|------|---------------|------|
| wallpaper phase | false (invalid) | SSIM gamed; not interactive |
| 404-poisoned loop | false (invalid) | Scores ~0.07 fake |
| post-restore interactive | false | Correct product shape; fidelity uneven |
| 2026-07-30T20:52:38Z | **false** | report.json: fail 16/19; gate OPEN |
| 2026-07-30T20:56:07Z | **false** | report.json: fail 16/19; worst abhigyan/data-viz; gate OPEN |
| post report.json rescore | **false** | report.json fails: data-viz 0.296 was worst; 16/19 &lt; 0.55; gate OPEN |
| 2026-07-30T21:05:48Z | **false** | report.json fails: data-viz 0.346 worst; still 16/19 &lt; 0.55; gate OPEN |
| 2026-07-30T21:09:09Z | **false** | report.json fails: data-viz 0.339 worst; still 16/19 &lt; 0.55; gate OPEN |
| 2026-07-30T21:12:40Z | **false** | report.json fails: data-viz 0.307 worst; still 16/19 &lt; 0.55; gate OPEN |
| 2026-07-30 (current report.json) | **false** | fail 16/19; worst data-viz 0.3075; gate OPEN; next: inspo-html-loop start_round &gt; r6 |

Update this file only when `node tools/verify-inspo.mjs` has been run and numbers are quoted.
