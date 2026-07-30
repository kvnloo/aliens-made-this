# LOOP-RESIDUALS

Living backlog for `inspo-html-loop`. Update after every OpenCV round.

**Priority tags:**  
`(A)` composition/structure · `(B)` color/density · `(C)` assets/detail · `(D)` chrome/interaction · `(E)` capture/infra

## Last verify (ground truth)

| Field | Value |
|-------|--------|
| when | 2026-07-30T21:05:48.546Z (`tools/verify-out/REPORT.md` + `report.json`) |
| command | `node tools/verify-inspo.mjs` |
| pass_score | **0.55** |
| fail_count | **16** / 19 |
| pass_count | **3** (dashboard 0.600, fishing-app 0.628, dashboard-uied 0.644) |
| evidence | `tools/verify-out/report.json` |
| ship_gate | **OPEN** |

## Active residuals (worst score first)

Scores quoted from `tools/verify-out/report.json` (`score` field).

| Priority | id | Score | Tag | Residual |
|----------|-----|-------|-----|----------|
| P0 | data-viz | 0.346 | A | rewrite — mountain analytics; SSIM 0.337 / edge 0.043 / hist 0.364 |
| P0 | course | 0.366 | A/C | rewrite — desk/monitor/tablet isometric hero density vs inspo; hist 0.200 |
| P0 | pizza | 0.388 | C | rewrite — food photography density vs flat UI; edge 0.047 |
| P0 | abhigyan | 0.388 | A | rewrite — dark finance orbs dual-phone; hist 0.098 |
| P1 | ocean | 0.464 | A/C | layered landscape / HUD density; edge 0.019 |
| P1 | nature-mobile | 0.465 | A | botanical dual phones vs inspo/02.jpg composition |
| P1 | boahat | 0.467 | A/C | photoreal travel dual-phone mass vs thin HTML finance board |
| P1 | fitness | 0.471 | A | dual dark phones + orange split bg |
| P1 | isometric | 0.476 | A/B | isometric landing mass + color |
| P1 | glass | 0.494 | A | dual-phone glass composition (not flat cards) |
| P1 | 3d-mobile | 0.498 | A/B | 3d phone stack vs inspo/03 |
| P1 | ux-pizza | 0.502 | C | midjourney food chrome density |
| P2 | 3d-landing | 0.518 | A/B | 3d landing hero composition; hist 0.268 |
| P2 | pasta | 0.519 | A/B | pasta dashboard composition + polish |
| P2 | travel | 0.543 | A/B | travel booking layout; near gate |
| P2 | dark-game | 0.543 | A/B | dark game UI; near gate |
| OK | dashboard | 0.600 | B | polish only |
| OK | fishing-app | 0.628 | B | polish only |
| OK | dashboard-uied | 0.644 | B | polish only |

## Infra

- [x] verify-inspo owns static server; abort on 404/small shots  
- [x] Forbidden wallpaper stubs  
- [x] `report.json` is score source of truth (16 failing &lt; 0.55)  
- [ ] Gate OPEN while any inspo-linked id &lt; pass_score (16 failing)

## Do not

- Full-bleed inspo wallpaper  
- Claim ship without report.json  
- Invent OpenCV scores  
