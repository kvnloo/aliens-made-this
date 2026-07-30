# PROMPT-TRUTH

Honesty log for the ship gate. **Never invent YES.**

| Field | Value |
|-------|--------|
| last_updated | 2026-07-30 (from tools/verify-out/report.json) |
| pass_score | 0.55 |
| ship_gate_met | **false** |
| reason | 16/19 demos score < 0.55; only 3 pass. Failing ids: data-viz (0.2745), course (0.3544), pizza (0.3738), abhigyan (0.43), ocean (0.4643), nature-mobile (0.4645), boahat (0.4673), fitness (0.471), isometric (0.4756), glass (0.4942), 3d-mobile (0.4984), ux-pizza (0.502), 3d-landing (0.5181), pasta (0.5186), travel (0.5429), dark-game (0.5431). Passing: dashboard (0.5999), fishing-app (0.6285), dashboard-uied (0.6445). Worst: data-viz 0.2745. Interactive HTML shape OK; OpenCV fidelity gate not met. |
| evidence | tools/verify-out/report.json |
| wallpaper_stubs_present | **false** (reverted) |
| next_action | Relaunch `/workflow inspo-html-loop` with `start_round` > r14; P0 rewrite: data-viz, course, pizza; rework abhigyan + rest until all scores ≥ 0.55 or residuals explicitly deferred |

## Failing ids (score < 0.55)

| id | score | grade | need |
|----|-------|-------|------|
| data-viz | 0.2745 | D/F | rewrite |
| course | 0.3544 | D/F | rewrite |
| pizza | 0.3738 | D/F | rewrite |
| abhigyan | 0.43 | C | rework |
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
| post report.json rescore | **false** | report.json fails: data-viz 0.296 was worst; 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:05:48Z | **false** | report.json fails: data-viz 0.346 worst; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:09:09Z | **false** | report.json fails: data-viz 0.339 worst; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:12:40Z | **false** | report.json fails: data-viz 0.307 worst; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:14:40Z | **false** | report.json: fail 16/19; worst data-viz 0.3074; gate OPEN; next: inspo-html-loop start_round > r6 |
| 2026-07-30T21:17:33Z | **false** | report.json fails: data-viz 0.3129 worst; course 0.3288; pizza 0.3977; abhigyan 0.4028; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:21:04Z | **false** | report.json fails: data-viz 0.3259 worst; course 0.3355; pizza 0.4073; abhigyan 0.4095; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:24:40Z | **false** | report.json fails: data-viz 0.2929 worst; course 0.3755; pizza 0.3972; abhigyan 0.4034; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:28:14Z | **false** | report.json fails: data-viz 0.3037 worst; course 0.3761; pizza 0.3918; abhigyan 0.4014; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:33:15Z | **false** | report.json fails: data-viz 0.3375 worst; course 0.3688; pizza 0.3911; abhigyan 0.4243; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:36:33Z | **false** | report.json fails: data-viz 0.2867 worst; course 0.3575; pizza 0.3854; abhigyan 0.4231; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:41:49Z | **false** | report.json fails: data-viz 0.2992 worst; course 0.3635; pizza 0.38; abhigyan 0.4272; still 16/19 < 0.55; gate OPEN |
| 2026-07-30T21:45:16Z | **false** | report.json fails: data-viz 0.2745 worst; course 0.3544; pizza 0.3738; abhigyan 0.43; still 16/19 < 0.55; gate OPEN |
| post r14 gate check | **false** | report.json: fail 16/19; worst data-viz 0.2745; next: inspo-html-loop start_round > r14 |

Update this file only when `node tools/verify-inspo.mjs` has been run and numbers are quoted.
