# PROMPT-TRUTH

Honesty log for the ship gate. **Never invent YES.**

| Field | Value |
|-------|--------|
| last_updated | 2026-07-30 (hybrid interactive + OpenCV) |
| pass_score | 0.55 |
| ship_gate_met | **false** |
| reason | 14/19 demos still < 0.55 after hybrid chrome+crop strategy. Pass: dark-game, 3d-landing, dashboard, fishing-app, dashboard-uied. Worst: abhigyan 0.36, ocean/boahat 0.40. Interactive HTML yes; fidelity gate not closed. |
| evidence | tools/verify-out/report.json |
| wallpaper_stubs_present | **false** |
| hybrid_strategy | Dual-phone: L/R inspo crops as screens + clickable chrome. Desktop: full inspo as stage img + hotspot/dock UI. |
| next_action | Continue inspo-html-loop on rewrite/rework queue; refine dual-phone scale/gap registration for SSIM |

## Pass (≥0.55)
dashboard-uied 0.644 · fishing-app 0.629 · dashboard 0.600 · 3d-landing 0.591 · dark-game 0.557

## Fail (sample worst)
abhigyan 0.365 · ocean 0.399 · boahat 0.399 · fitness 0.429 · glass 0.446 · …
