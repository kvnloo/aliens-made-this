# LOOP-RESIDUALS

Living backlog for `inspo-html-loop`. Update after every OpenCV round.

**Priority tags:**  
`(A)` composition/structure · `(B)` color/density · `(C)` assets/detail · `(D)` chrome/interaction · `(E)` capture/infra

## Last verify (ground truth)

| Field | Value |
|-------|--------|
| when | 2026-07-30T22:07:37.480Z (`tools/verify-out/REPORT.md` + `report.json`) |
| command | `node tools/verify-inspo.mjs` |
| pass_score | **0.55** |
| fail_count | **14** / 19 |
| pass_count | **5** (dark-game 0.5573, 3d-landing 0.5905, dashboard 0.5999, fishing-app 0.6285, dashboard-uied 0.6445) |
| evidence | `tools/verify-out/report.json` |
| ship_gate | **OPEN** |

## Active residuals (worst score first)

Scores quoted from `tools/verify-out/report.json` (`score` field).

| Priority | id | Score | Tag | Residual |
|----------|-----|-------|-----|----------|
| P0 | abhigyan | 0.3529 | A/B | rewrite — hist −0.1198 / edge 0.0136; dual-phone finance orbs miss color mass |
| P0 | boahat | 0.4152 | A/C | rework — photoreal travel dual-phone vs thin finance board; hist 0.2359 / edge 0.0255 |
| P0 | ocean | 0.4160 | A/C | rework — landscape/HUD density; SSIM 0.4381 / edge 0.0276 |
| P1 | nature-mobile | 0.4450 | A | rework — botanical dual phones vs inspo/02.jpg; hist 0.2707 |
| P1 | fitness | 0.4711 | A/B | rework — dual dark phones + orange split; hist 0.3611 / edge 0.0089 |
| P1 | glass | 0.4771 | A | rework — dual-phone glass composition (not flat cards); edge 0.0156 / hist 0.4945 |
| P1 | pizza | 0.4873 | C | rework — food photography density vs flat UI; SSIM 0.4997 |
| P1 | 3d-mobile | 0.4899 | A/B | rework — 3d phone stack vs inspo/03; hist 0.4333 |
| P1 | course | 0.4990 | A/C | rework — desk/monitor/tablet isometric hero density; edge 0.0228 |
| P1 | data-viz | 0.5021 | A | rework — mountain analytics composition; edge 0.0359 / SSIM 0.5194 |
| P2 | travel | 0.5151 | A/B | rework — travel booking layout; near gate; hist 0.454 |
| P2 | ux-pizza | 0.5155 | C | rework — midjourney food chrome density |
| P2 | isometric | 0.5311 | A/B | rework — isometric landing mass + color |
| P2 | pasta | 0.5402 | A/B | rework — pasta dashboard composition + polish |
| OK | dark-game | 0.5573 | B | polish only |
| OK | 3d-landing | 0.5905 | B | polish only |
| OK | dashboard | 0.5999 | B | polish only |
| OK | fishing-app | 0.6285 | B | polish only |
| OK | dashboard-uied | 0.6445 | B | polish only |

## Infra

- [x] verify-inspo owns static server; abort on 404/small shots  
- [x] Forbidden wallpaper stubs  
- [x] `report.json` is score source of truth (14 failing &lt; 0.55)  
- [ ] Gate OPEN while any inspo-linked id &lt; pass_score (14 failing)

## Do not

- Full-bleed inspo wallpaper  
- Claim ship without report.json  
- Invent OpenCV scores  
