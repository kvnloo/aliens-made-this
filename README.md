# aliens-made-this

**An experiment:** can LLM agents + tool calling + a visual verification loop turn design inspo into **interactive HTML that actually looks like the inspo**?

Not a polished portfolio claim. Lab notebook + live demos + metrics.

**Live site:** [kvnloo.github.io/aliens-made-this](https://kvnloo.github.io/aliens-made-this/)  
**Experiment log:** [docs/EXPERIMENT.md](docs/EXPERIMENT.md)  
**Method / loop:** [docs/PIXEL-PERFECT-METHOD.md](docs/PIXEL-PERFECT-METHOD.md)

## What this is

1. **`inspo/`** — reference UI images (Midjourney-style mocks, etc.).
2. **`pixel-perfect/`** — **interactive** HTML/CSS implementations (not wallpapers).
3. **`index.html`** — gallery with **sliding inspo ↔ live demo** compare.
4. **`tools/verify-inspo.mjs`** — Chromium screenshot + **OpenCV** SSIM/hist/edge scores (ship gate).
5. **`.grok/workflows/pixel-perfect-loop.rhai`** — unattended rebuild → re-verify loop.

Inspired by [Alien Interfaces](https://alieninterfaces.com/) (same *spirit*, not their case studies).  
Playlist: [YouTube](https://www.youtube.com/playlist?list=PL08jItIqOb2oMXWRZTPua0nC3oZ6Stoul).

## Hard rules (learned the hard way)

| Do | Don’t |
|----|--------|
| Interactive DOM HTML | Full-bleed `background: url(inspo)` as the “demo” |
| Open inspo image before coding | Trust “looks pixel-perfect” from an LLM |
| OpenCV `report.json` as pass/fail | Score against 404/blank screenshots |
| Loop rebuild → re-verify | Stop after a ranking report |

## Quick start

```bash
# browse
python3 -m http.server 8000
# open http://localhost:8000/

# visual scores (script owns its HTTP server)
python3 -m venv .venv-verify && .venv-verify/bin/pip install -q opencv-python-headless numpy
cd tools && npm i puppeteer-core@23 && node verify-inspo.mjs
# → tools/verify-out/REPORT.md
```

Workflow (Grok): `/workflow pixel-perfect-loop` — see experiment log for args.

## Demo map

| Demo | Inspo | Notes |
|------|--------|--------|
| [dashboard.html](pixel-perfect/dashboard.html) | [original-a16c4c…](inspo/original-a16c4c2967229fa52683443ee0c26903.webp) | Carlic fintech — strongest HTML pass so far |
| [dashboard_uied.html](pixel-perfect/dashboard_uied.html) | same | Alt pass |
| [fishing-app.html](pixel-perfect/fishing-app.html) | same | Glass variant |
| [01.html](pixel-perfect/01.html) | [01.jpg](inspo/01.jpg) | Dual-phone glass |
| [nature-mobile-ui.html](pixel-perfect/nature-mobile-ui.html) | [02.jpg](inspo/02.jpg) | |
| [3d-mobile-ui.html](pixel-perfect/3d-mobile-ui.html) | [03.jpg](inspo/03.jpg) | |
| [data-viz-dashboard.html](pixel-perfect/data-viz-dashboard.html) | [Fjm_ePF…](inspo/Fjm_ePFVEAIb2zq.jpeg) | Landscape analytics |
| [ocean-dashboard.html](pixel-perfect/ocean-dashboard.html) | [Fjm_dss…](inspo/Fjm_dssVIAAq4T2.jpg) | Sci-fi HUD |
| [pasta-dashboard.html](pixel-perfect/pasta-dashboard.html) | [FjtjX…](inspo/FjtjX_saEAAeA3u.jpeg) | |
| [travel-booking-app.html](pixel-perfect/travel-booking-app.html) | [FjtjXt…](inspo/FjtjXt6aMAAKt_U.jpeg) | |
| [dark-game-ui.html](pixel-perfect/dark-game-ui.html) | [FjtjY…](inspo/FjtjYmaaAAAcDNC.jpeg) | |
| [fitness-health-app.html](pixel-perfect/fitness-health-app.html) | [Francesco…](inspo/Francesco.Svara_A_side_by_side_UIUx_design_screens_of_an_app_wh_8a755e3d-d655-4ee6-8520-4d542a66ff5b.png) | |
| [abhigyan-mobile-app.html](pixel-perfect/abhigyan-mobile-app.html) | [Abhigyan…](inspo/AbhigyanPatwari_UI_UX_design_side_by_side_Behance_Dribble_beaut_25f4f864-f958-4ca1-b5ad-2cef9e795633.png) | |
| [pizza-food-app.html](pixel-perfect/pizza-food-app.html) | [1_lKE…](inspo/1_lKE4lwy3QcSqDh8-CBYijg.png) | |
| [ux-midjourney-app.html](pixel-perfect/ux-midjourney-app.html) | [UX-Midjourney…](inspo/UX-Design-Midjourney-008-980x980.jpg) | |
| [finance-dashboard.html](pixel-perfect/finance-dashboard.html) | [original-4e…](inspo/original-4e145bbd4a9682e9bbf3129051205edc.webp) | BOAHAT travel |
| [isometric-landing-page.html](pixel-perfect/isometric-landing-page.html) | [Lookasz…](inspo/Lookasz_use_colors_from_link_landing_page_with_buttons_and_larg_96dc354a-d397-461f-93a3-ef2ba1ad7f4e.png) | |
| [3d-landing-page.html](pixel-perfect/3d-landing-page.html) | [jslowsky…](inspo/jslowsky_landing_page_design_Desentralize_organization_high-qua_1c5bbb7c-1377-4887-b626-b86a886b6ea6.png) | |
| [online-course-website.html](pixel-perfect/online-course-website.html) | [Ds_Beautiful…](inspo/Ds_Beautiful_online_course_website_ui_ux_ui_ux_website_shallow__2a8acff8-57de-4994-a426-5a39ec7acf04.png) | |
| [motherduck.html](pixel-perfect/motherduck.html) | *(product)* | |
| [harness.html](pixel-perfect/harness.html) | *(product)* | |
| [trading.html](pixel-perfect/trading.html) | *(no local inspo)* | |

Quality vs inspo is **uneven** — see latest `tools/verify-out/REPORT.md` after you run verify.

## License

[LICENSE](LICENSE). Not affiliated with Alien Interfaces / CJ Gammon.
