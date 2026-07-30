# LOOP-RESIDUALS

Living backlog for `inspo-html-loop`. Update after every OpenCV round.

**Priority tags:**  
`(A)` composition/structure · `(B)` color/density · `(C)` assets/detail · `(D)` chrome/interaction · `(E)` capture/infra

## Last verify (ground truth)

| Field | Value |
|-------|--------|
| when | 2026-07-30T22:31:26.317Z (`tools/verify-out/REPORT.md` + `report.json`) |
| command | `node tools/verify-inspo.mjs` |
| pass_score | **0.55** |
| fail_count | **6** / 19 |
| pass_count | **13** (ux-pizza 0.5719, dashboard 0.5999, pasta 0.6097, pizza 0.6187, 3d-mobile 0.622, fishing-app 0.6285, dashboard-uied 0.6445, course 0.6514, isometric 0.6557, dark-game 0.6612, ocean 0.6635, 3d-landing 0.665, data-viz 0.7063) |
| evidence | `tools/verify-out/report.json` |
| ship_gate | **OPEN** |

## Active residuals (worst score first)

Scores quoted from `tools/verify-out/report.json` (`score` field).

| Priority | id | Score | Tag | Residual |
|----------|-----|-------|-----|----------|
| P0 | abhigyan | 0.3835 | A/B | rewrite — dual-phone finance orbs; hist 0.058 / edge 0.0302 / SSIM 0.5833 |
| P0 | boahat | 0.4024 | A/C | rework — dual-phone travel/finance mass; hist 0.221 / edge 0.0307 / SSIM 0.5408 |
| P1 | glass | 0.491 | A | rework — dual-phone glass composition (not flat cards); edge 0.015 / hist 0.5101 / SSIM 0.5822 |
| P1 | fitness | 0.5048 | A/B | rework — dual dark phones + orange split; hist 0.417 / edge 0.0214 / SSIM 0.6586 |
| P1 | nature-mobile | 0.5065 | A | rework — botanical dual phones vs inspo/02.jpg; hist 0.5609 / edge 0.0399 / SSIM 0.568 |
| P1 | travel | 0.5416 | A/B | rework — travel booking dual-phone; near gate; hist 0.5736 / edge 0.045 / SSIM 0.6241 |
| OK | ux-pizza | 0.5719 | C | polish only |
| OK | dashboard | 0.5999 | B | polish only |
| OK | pasta | 0.6097 | B | polish only |
| OK | pizza | 0.6187 | C | polish only |
| OK | 3d-mobile | 0.622 | B | polish only |
| OK | fishing-app | 0.6285 | B | polish only |
| OK | dashboard-uied | 0.6445 | B | polish only |
| OK | course | 0.6514 | B | polish only |
| OK | isometric | 0.6557 | B | polish only |
| OK | dark-game | 0.6612 | B | polish only |
| OK | ocean | 0.6635 | B | polish only |
| OK | 3d-landing | 0.665 | B | polish only |
| OK | data-viz | 0.7063 | B | polish only |

## Infra

- [x] verify-inspo owns static server; abort on 404/small shots  
- [x] Forbidden wallpaper stubs  
- [x] `report.json` is score source of truth (6 failing &lt; 0.55)  
- [ ] Gate OPEN while any inspo-linked id &lt; pass_score (6 failing)

## Do not

- Full-bleed inspo wallpaper  
- Claim ship without report.json  
- Invent OpenCV scores  
