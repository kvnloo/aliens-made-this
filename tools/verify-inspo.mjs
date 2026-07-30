/**
 * Capture each pixel-perfect demo and score vs its inspo image (ui-verify style).
 * Usage: node tools/verify-inspo.mjs [baseUrl]
 * If baseUrl omitted, starts its own python http.server on an ephemeral port
 * under the repo root (avoids the 404-all-shots failure mode).
 */
import puppeteer from 'puppeteer-core';
import { mkdirSync, writeFileSync, existsSync, readFileSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';
import { spawn } from 'child_process';
import { createServer } from 'http';
import { createReadStream, statSync } from 'fs';
import { extname } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = join(__dirname, '..');
const OUT = join(ROOT, 'tools', 'verify-out');
const PYTHON = join(ROOT, '.venv-verify', 'bin', 'python');

mkdirSync(OUT, { recursive: true });
mkdirSync(join(OUT, 'shots'), { recursive: true });
mkdirSync(join(OUT, 'diffs'), { recursive: true });

const MIME = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript',
  '.css': 'text/css',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.webp': 'image/webp',
  '.svg': 'image/svg+xml',
  '.md': 'text/markdown',
};

/** Static server rooted at ROOT so paths match GH Pages layout. */
function startStaticServer() {
  return new Promise((resolve, reject) => {
    const server = createServer((req, res) => {
      try {
        let urlPath = decodeURIComponent((req.url || '/').split('?')[0]);
        if (urlPath === '/') urlPath = '/index.html';
        const filePath = join(ROOT, urlPath.replace(/^\//, ''));
        if (!filePath.startsWith(ROOT) || !existsSync(filePath) || statSync(filePath).isDirectory()) {
          res.writeHead(404, { 'Content-Type': 'text/plain' });
          res.end('Not Found: ' + urlPath);
          return;
        }
        res.writeHead(200, { 'Content-Type': MIME[extname(filePath)] || 'application/octet-stream' });
        createReadStream(filePath).pipe(res);
      } catch (e) {
        res.writeHead(500);
        res.end(String(e));
      }
    });
    server.listen(0, '127.0.0.1', () => {
      const { port } = server.address();
      resolve({ server, base: `http://127.0.0.1:${port}` });
    });
    server.on('error', reject);
  });
}

let BASE = process.argv[2] || null;
let ownedServer = null;

/** Same pairs as index.html gallery (inspo-linked only) */
const PAIRS = [
  { id: 'dashboard', demo: 'pixel-perfect/dashboard.html', inspo: 'inspo/original-a16c4c2967229fa52683443ee0c26903.webp' },
  { id: 'dashboard-uied', demo: 'pixel-perfect/dashboard_uied.html', inspo: 'inspo/original-a16c4c2967229fa52683443ee0c26903.webp' },
  { id: 'fishing-app', demo: 'pixel-perfect/fishing-app.html', inspo: 'inspo/original-a16c4c2967229fa52683443ee0c26903.webp' },
  { id: 'data-viz', demo: 'pixel-perfect/data-viz-dashboard.html', inspo: 'inspo/Fjm_ePFVEAIb2zq.jpeg' },
  { id: 'ocean', demo: 'pixel-perfect/ocean-dashboard.html', inspo: 'inspo/Fjm_dssVIAAq4T2.jpg' },
  { id: 'pasta', demo: 'pixel-perfect/pasta-dashboard.html', inspo: 'inspo/FjtjX_saEAAeA3u.jpeg' },
  { id: 'glass', demo: 'pixel-perfect/01.html', inspo: 'inspo/01.jpg' },
  { id: 'nature-mobile', demo: 'pixel-perfect/nature-mobile-ui.html', inspo: 'inspo/02.jpg' },
  { id: '3d-mobile', demo: 'pixel-perfect/3d-mobile-ui.html', inspo: 'inspo/03.jpg' },
  { id: 'abhigyan', demo: 'pixel-perfect/abhigyan-mobile-app.html', inspo: 'inspo/AbhigyanPatwari_UI_UX_design_side_by_side_Behance_Dribble_beaut_25f4f864-f958-4ca1-b5ad-2cef9e795633.png' },
  { id: 'travel', demo: 'pixel-perfect/travel-booking-app.html', inspo: 'inspo/FjtjXt6aMAAKt_U.jpeg' },
  { id: 'fitness', demo: 'pixel-perfect/fitness-health-app.html', inspo: 'inspo/Francesco.Svara_A_side_by_side_UIUx_design_screens_of_an_app_wh_8a755e3d-d655-4ee6-8520-4d542a66ff5b.png' },
  { id: 'pizza', demo: 'pixel-perfect/pizza-food-app.html', inspo: 'inspo/1_lKE4lwy3QcSqDh8-CBYijg.png' },
  { id: 'ux-pizza', demo: 'pixel-perfect/ux-midjourney-app.html', inspo: 'inspo/UX-Design-Midjourney-008-980x980.jpg' },
  { id: 'boahat', demo: 'pixel-perfect/finance-dashboard.html', inspo: 'inspo/original-4e145bbd4a9682e9bbf3129051205edc.webp' },
  { id: 'isometric', demo: 'pixel-perfect/isometric-landing-page.html', inspo: 'inspo/Lookasz_use_colors_from_link_landing_page_with_buttons_and_larg_96dc354a-d397-461f-93a3-ef2ba1ad7f4e.png' },
  { id: '3d-landing', demo: 'pixel-perfect/3d-landing-page.html', inspo: 'inspo/jslowsky_landing_page_design_Desentralize_organization_high-qua_1c5bbb7c-1377-4887-b626-b86a886b6ea6.png' },
  { id: 'course', demo: 'pixel-perfect/online-course-website.html', inspo: 'inspo/Ds_Beautiful_online_course_website_ui_ux_ui_ux_website_shallow__2a8acff8-57de-4994-a426-5a39ec7acf04.png' },
  { id: 'dark-game', demo: 'pixel-perfect/dark-game-ui.html', inspo: 'inspo/FjtjYmaaAAAcDNC.jpeg' },
];

const FREEZE = `*{animation:none!important;transition:none!important;caret-color:transparent!important}`;

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function shootDemo(browser, pair) {
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 900, deviceScaleFactor: 1 });
  const url = `${BASE}/${pair.demo}`;
  const resp = await page.goto(url, { waitUntil: 'load', timeout: 45000 }).catch((e) => {
    throw new Error(`goto failed ${url}: ${e.message}`);
  });
  const status = resp ? resp.status() : 0;
  if (status !== 200) {
    await page.close();
    throw new Error(`HTTP ${status} for ${url} — refusing to score (would poison OpenCV)`);
  }
  const bodyText = await page.evaluate(() => document.body?.innerText?.slice(0, 200) || '');
  if (/Error code: 404|Not Found/i.test(bodyText)) {
    await page.close();
    throw new Error(`404 body for ${url} — refusing to score`);
  }
  await page.evaluate((css) => {
    const s = document.createElement('style');
    s.textContent = css;
    document.head.appendChild(s);
  }, FREEZE);
  await page.evaluate(() => document.fonts.ready).catch(() => {});
  await sleep(600);
  await page.evaluate(async () => {
    const imgs = [...document.images];
    await Promise.all(imgs.map(i => i.complete ? null : new Promise(r => { i.onload=i.onerror=r; })));
    // wait for CSS backgrounds roughly
    await new Promise(r => setTimeout(r, 400));
  }).catch(()=>{});
  await sleep(300);
  const shotPath = join(OUT, 'shots', `${pair.id}_demo.png`);
  await page.screenshot({ path: shotPath, fullPage: false });
  await page.close();
  // reject tiny/blank shots (historical failure: all 18KB identical 404 frames)
  const bytes = statSync(shotPath).size;
  if (bytes < 8000) {
    throw new Error(`shot too small (${bytes}B) for ${pair.id} — likely blank/404`);
  }
  return shotPath;
}

function runPythonCompare(pairsJson) {
  return new Promise((resolve, reject) => {
    const py = `
import json, sys, os
import cv2
import numpy as np

pairs = json.loads(sys.argv[1])
out_dir = sys.argv[2]
results = []

def prep(path, size=(960, 600)):
    img = cv2.imread(path, cv2.IMREAD_COLOR)
    if img is None:
        # try webp via imdecode
        data = np.fromfile(path, dtype=np.uint8)
        img = cv2.imdecode(data, cv2.IMREAD_COLOR)
    if img is None:
        return None
    return cv2.resize(img, size, interpolation=cv2.INTER_AREA)

def hist_corr(a, b):
    # mean correlation across BGR hist
    cors = []
    for i in range(3):
        ha = cv2.calcHist([a],[i],None,[64],[0,256])
        hb = cv2.calcHist([b],[i],None,[64],[0,256])
        cv2.normalize(ha, ha)
        cv2.normalize(hb, hb)
        cors.append(float(cv2.compareHist(ha, hb, cv2.HISTCMP_CORREL)))
    return sum(cors)/len(cors)

def edge_ssim_proxy(a, b):
    ga = cv2.cvtColor(a, cv2.COLOR_BGR2GRAY)
    gb = cv2.cvtColor(b, cv2.COLOR_BGR2GRAY)
    ea = cv2.Canny(ga, 80, 160)
    eb = cv2.Canny(gb, 80, 160)
    # dice-like overlap of edges
    inter = np.logical_and(ea>0, eb>0).sum()
    union = np.logical_or(ea>0, eb>0).sum()
    edge_jaccard = float(inter)/float(union) if union else 0.0
    # MS-SSIM-ish: template match normalized + mse
    mse = float(np.mean((ga.astype(np.float32)-gb.astype(np.float32))**2))
    nrmse = 1.0 - min(1.0, (mse ** 0.5) / 255.0)
    # OpenCV SSIM if available (contrib); else manual
    try:
        score, _ = cv2.quality.QualitySSIM_compute(ga, gb)
        ssim = float(score[0])
    except Exception:
        # simplified SSIM
        C1 = (0.01*255)**2
        C2 = (0.03*255)**2
        ga_f = ga.astype(np.float64)
        gb_f = gb.astype(np.float64)
        mu1 = cv2.GaussianBlur(ga_f, (11,11), 1.5)
        mu2 = cv2.GaussianBlur(gb_f, (11,11), 1.5)
        mu1_sq, mu2_sq, mu1_mu2 = mu1*mu1, mu2*mu2, mu1*mu2
        sig1_sq = cv2.GaussianBlur(ga_f*ga_f, (11,11), 1.5) - mu1_sq
        sig2_sq = cv2.GaussianBlur(gb_f*gb_f, (11,11), 1.5) - mu2_sq
        sig12 = cv2.GaussianBlur(ga_f*gb_f, (11,11), 1.5) - mu1_mu2
        ssim_map = ((2*mu1_mu2 + C1)*(2*sig12 + C2)) / ((mu1_sq + mu2_sq + C1)*(sig1_sq + sig2_sq + C2))
        ssim = float(ssim_map.mean())
    return ssim, edge_jaccard, nrmse, mse

for p in pairs:
    demo = p['demo_shot']
    inspo = p['inspo_path']
    a = prep(demo)
    b = prep(inspo)
    if a is None or b is None:
        results.append({**p, 'error': 'load_failed', 'ssim': 0, 'hist': 0, 'edge': 0, 'score': 0, 'grade': 'F'})
        continue
    ssim, edge, nrmse, mse = edge_ssim_proxy(a, b)
    hist = hist_corr(a, b)
    # composite: layout structure + color palette matter most for UI
    score = 0.50*ssim + 0.25*max(0, hist) + 0.15*edge + 0.10*nrmse
    # absolute diff heatmap
    diff = cv2.absdiff(a, b)
    heat = cv2.applyColorMap(cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY), cv2.COLORMAP_JET)
    side = np.hstack([b, a, heat])
    diff_path = os.path.join(out_dir, 'diffs', p['id'] + '_compare.jpg')
    cv2.imwrite(diff_path, side, [int(cv2.IMWRITE_JPEG_QUALITY), 85])
    if score >= 0.72:
        grade = 'A'
        need = 'ok'
    elif score >= 0.55:
        grade = 'B'
        need = 'polish'
    elif score >= 0.40:
        grade = 'C'
        need = 'rework'
    else:
        grade = 'D/F'
        need = 'rewrite'
    results.append({
        'id': p['id'],
        'demo': p['demo'],
        'inspo': p['inspo'],
        'ssim': round(ssim, 4),
        'hist': round(hist, 4),
        'edge': round(edge, 4),
        'nrmse': round(nrmse, 4),
        'mse': round(mse, 1),
        'score': round(score, 4),
        'grade': grade,
        'need': need,
        'diff': diff_path,
    })

results.sort(key=lambda r: r.get('score', 0))
print(json.dumps(results, indent=2))
`;
    const args = [
      '-c',
      py,
      JSON.stringify(pairsJson),
      OUT,
    ];
    const child = spawn(PYTHON, args, { stdio: ['ignore', 'pipe', 'pipe'] });
    let out = '';
    let err = '';
    child.stdout.on('data', (d) => (out += d));
    child.stderr.on('data', (d) => (err += d));
    child.on('close', (code) => {
      if (code !== 0) reject(new Error(err || out || `python exit ${code}`));
      else {
        try {
          resolve(JSON.parse(out));
        } catch (e) {
          reject(new Error('bad json: ' + out.slice(0, 500) + '\n' + err));
        }
      }
    });
  });
}

if (!BASE) {
  ownedServer = await startStaticServer();
  BASE = ownedServer.base;
  console.log('owned static server', BASE);
}

// sanity: dashboard must 200
{
  const r = await fetch(`${BASE}/pixel-perfect/dashboard.html`);
  if (!r.ok) {
    if (ownedServer) ownedServer.server.close();
    throw new Error(`preflight failed: dashboard HTTP ${r.status} at ${BASE}`);
  }
  console.log('preflight OK', r.status);
}

const browser = await puppeteer.launch({
  executablePath: '/usr/bin/chromium',
  headless: 'new',
  args: ['--no-sandbox', '--disable-gpu', '--force-device-scale-factor=1', '--hide-scrollbars'],
});

const captured = [];
try {
  for (const pair of PAIRS) {
    const inspoPath = join(ROOT, pair.inspo);
    if (!existsSync(inspoPath)) {
      console.warn('skip missing inspo', pair.id);
      continue;
    }
    if (!existsSync(join(ROOT, pair.demo))) {
      console.warn('skip missing demo', pair.id);
      continue;
    }
    process.stdout.write(`shot ${pair.id}… `);
    const demoShot = await shootDemo(browser, pair);
    console.log('ok');
    captured.push({
      ...pair,
      demo_shot: demoShot,
      inspo_path: inspoPath,
    });
  }
} finally {
  await browser.close();
  if (ownedServer) ownedServer.server.close();
}

if (captured.length === 0) {
  throw new Error('no demos captured — aborting before OpenCV');
}

console.log('comparing…');
const results = await runPythonCompare(captured);
writeFileSync(join(OUT, 'report.json'), JSON.stringify(results, null, 2));

// markdown summary
const lines = [
  '# Inspo ↔ demo visual verification',
  '',
  `Base: ${BASE}`,
  `Date: ${new Date().toISOString()}`,
  '',
  'Score = 0.50·SSIM + 0.25·hist_corr + 0.15·edge_jaccard + 0.10·nrmse',
  '',
  '| Rank | ID | Grade | Score | SSIM | Hist | Edge | Need |',
  '|------|----|-------|-------|------|------|------|------|',
];
[...results].sort((a, b) => a.score - b.score).forEach((r, i) => {
  lines.push(
    `| ${i + 1} | \`${r.id}\` | **${r.grade}** | ${r.score?.toFixed?.(3) ?? r.score} | ${r.ssim} | ${r.hist} | ${r.edge} | ${r.need} |`
  );
});
lines.push('');
lines.push('## Needs rewrite (score < 0.40)');
results.filter((r) => r.need === 'rewrite').forEach((r) => lines.push(`- **${r.id}** (${r.score}) — \`${r.demo}\` vs \`${r.inspo}\``));
lines.push('');
lines.push('## Needs rework (0.40–0.55)');
results.filter((r) => r.need === 'rework').forEach((r) => lines.push(`- **${r.id}** (${r.score})`));
lines.push('');
lines.push('## Polish (0.55–0.72)');
results.filter((r) => r.need === 'polish').forEach((r) => lines.push(`- **${r.id}** (${r.score})`));
lines.push('');
lines.push('## OK (≥ 0.72)');
results.filter((r) => r.need === 'ok').forEach((r) => lines.push(`- **${r.id}** (${r.score})`));
lines.push('');
lines.push('Diff contact sheets: `tools/verify-out/diffs/*_compare.jpg` (inspo | demo | heat)');
writeFileSync(join(OUT, 'REPORT.md'), lines.join('\n'));

console.log('\n' + lines.join('\n'));
console.log('\nWrote', join(OUT, 'report.json'), 'and REPORT.md');
