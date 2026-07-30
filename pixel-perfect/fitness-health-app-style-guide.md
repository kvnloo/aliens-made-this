# Fitness & Health App - Style Guide

## Design Analysis
**Type:** Fitness Tracking Mobile App
**Style:** Dark mode, modern, data-focused with circular progress indicators
**Platform:** Mobile (iOS/Android)
**Screens:** Dual layout showing workout list and activity tracking

## Color Palette

### Background & Base
- **Primary Background:** `#1C1C1E` (dark gray, iOS dark mode)
- **Card Background:** `#2C2C2E` (elevated dark)
- **Secondary Card:** `#3A3A3C` (lighter elevated)
- **Input Background:** `#FFFFFF` (white for contrast)

### Accent Colors
- **Primary Orange:** `#FF8C42` to `#FF6B35` (gradient)
- **Health Red:** `#FF453A` (heart rate, warnings)
- **Success Green:** `#32D74B` (completion, positive)
- **Info Blue:** `#0A84FF` (informational)
- **Warning Yellow:** `#FFD60A` (caution)

### Text Colors
- **Primary Text:** `#FFFFFF`
- **Secondary Text:** `#98989D` (gray)
- **Tertiary Text:** `#636366` (darker gray)
- **Disabled:** `rgba(255, 255, 255, 0.3)`

### Chart/Graph Colors
- **Line Graph:** `#FF8C42` with `rgba(255, 140, 66, 0.1)` fill
- **Grid Lines:** `rgba(255, 255, 255, 0.1)`
- **Data Points:** `#FFFFFF` with orange border

## Typography
- **Font Family:**
  - Primary: 'SF Pro Display', -apple-system, 'Roboto', sans-serif
  - Monospace: 'SF Mono', 'Roboto Mono', monospace (for numbers/time)
- **Weights:** 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **App Title:** 18px, weight 600
- **Section Title:** 16px, weight 600
- **Card Title:** 15px, weight 500
- **Body Text:** 14px, weight 400
- **Caption:** 12px, weight 400
- **Large Number:** 48px, weight 700
- **Medium Number:** 24px, weight 600
- **Small Number:** 14px, weight 500

## Layout Structure (Mobile 375x812)

### Left Screen - Workout List
```
┌─────────────────────────┐
│  Header (60px)         │
│  + Graph Card (120px)  │
├─────────────────────────┤
│                        │
│  Workout List Items    │
│  (scrollable)          │
│                        │
└─────────────────────────┘
```

### Right Screen - Activity Detail
```
┌─────────────────────────┐
│  Header (60px)         │
│  + Date/Tabs (48px)    │
├─────────────────────────┤
│  Progress Ring (200px) │
├─────────────────────────┤
│  Metrics Grid (120px)  │
├─────────────────────────┤
│  Activity Stats List   │
│  (scrollable)          │
├─────────────────────────┤
│  Bottom Input (80px)   │
└─────────────────────────┘
```

## UI Components

### Header (Left Screen)
```css
.header {
  padding: 16px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.app-title {
  font-size: 28px;
  font-weight: 700;
  color: #FFFFFF;
}

.header-icons {
  display: flex;
  gap: 12px;
}

.icon-btn {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #2C2C2E;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

### Graph Card (Left Screen)
```css
.graph-card {
  background: #2C2C2E;
  border-radius: 16px;
  padding: 16px;
  margin: 0 20px 16px;
}

.graph-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.graph-title {
  font-size: 16px;
  font-weight: 600;
  color: #FFFFFF;
}

.graph-value {
  font-size: 18px;
  font-weight: 600;
  color: #FFFFFF;
}

.graph-label {
  font-size: 12px;
  color: #98989D;
}

.mini-chart {
  height: 60px;
  position: relative;
}

.chart-line {
  stroke: #FF8C42;
  stroke-width: 2;
  fill: none;
}

.chart-area {
  fill: url(#orangeGradient);
}
```

### Workout List Item
```css
.workout-item {
  background: #2C2C2E;
  border-radius: 16px;
  padding: 16px;
  margin: 0 20px 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.workout-info {
  flex: 1;
}

.workout-name {
  font-size: 15px;
  font-weight: 500;
  color: #FFFFFF;
  margin-bottom: 4px;
}

.workout-meta {
  display: flex;
  gap: 4px;
  align-items: center;
  font-size: 12px;
  color: #98989D;
}

.workout-meta-icon {
  width: 12px;
  height: 12px;
}

.workout-stats {
  display: flex;
  gap: 16px;
  align-items: center;
}

.workout-stat {
  text-align: right;
}

.workout-stat-value {
  font-size: 16px;
  font-weight: 600;
  color: #FFFFFF;
  display: flex;
  align-items: center;
  gap: 4px;
}

.workout-stat-label {
  font-size: 11px;
  color: #98989D;
}

.workout-icon {
  width: 24px;
  height: 24px;
  color: #98989D;
}
```

### Header (Right Screen)
```css
.detail-header {
  padding: 16px 20px;
}

.nav-back {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #FFFFFF;
  font-size: 16px;
  margin-bottom: 12px;
}

.activity-title {
  font-size: 24px;
  font-weight: 700;
  color: #FFFFFF;
  margin-bottom: 4px;
}

.activity-subtitle {
  font-size: 14px;
  color: #98989D;
}
```

### Date & Tab Bar
```css
.date-tab-bar {
  padding: 12px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.date-display {
  font-size: 14px;
  color: #98989D;
}

.tab-group {
  display: flex;
  gap: 8px;
}

.tab-btn {
  padding: 6px 16px;
  border-radius: 16px;
  background: transparent;
  border: 1px solid #3A3A3C;
  color: #98989D;
  font-size: 13px;
  transition: all 0.2s ease;
}

.tab-btn.active {
  background: #FF8C42;
  border-color: #FF8C42;
  color: #FFFFFF;
}
```

### Circular Progress (Right Screen)
```css
.progress-container {
  padding: 32px 20px;
  display: flex;
  justify-content: center;
}

.circular-progress {
  position: relative;
  width: 200px;
  height: 200px;
}

.progress-ring {
  transform: rotate(-90deg);
}

.progress-ring-bg {
  stroke: #2C2C2E;
  stroke-width: 12;
  fill: none;
}

.progress-ring-fill {
  stroke: url(#orangeGradient);
  stroke-width: 12;
  fill: none;
  stroke-linecap: round;
  transition: stroke-dashoffset 0.5s ease;
}

.progress-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.progress-value {
  font-size: 48px;
  font-weight: 700;
  color: #FF8C42;
  line-height: 1;
}

.progress-label {
  font-size: 14px;
  color: #98989D;
  margin-top: 4px;
}
```

### Metrics Grid
```css
.metrics-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;
  padding: 16px 20px;
}

.metric-item {
  text-align: center;
}

.metric-icon {
  width: 40px;
  height: 40px;
  margin: 0 auto 8px;
  background: #2C2C2E;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #FF8C42;
}

.metric-value {
  font-size: 16px;
  font-weight: 600;
  color: #FFFFFF;
  margin-bottom: 2px;
}

.metric-label {
  font-size: 11px;
  color: #98989D;
}
```

### Activity Stats List
```css
.stats-section {
  padding: 0 20px;
}

.section-title {
  font-size: 18px;
  font-weight: 600;
  color: #FFFFFF;
  margin-bottom: 16px;
}

.stat-item {
  background: #2C2C2E;
  border-radius: 12px;
  padding: 16px;
  margin-bottom: 12px;
  display: flex;
  align-items: center;
  gap: 12px;
}

.stat-icon {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  background: linear-gradient(135deg, #FF8C42 0%, #FF6B35 100%);
  display: flex;
  align-items: center;
  justify-content: center;
}

.stat-content {
  flex: 1;
}

.stat-name {
  font-size: 14px;
  font-weight: 500;
  color: #FFFFFF;
  margin-bottom: 4px;
}

.stat-detail {
  font-size: 12px;
  color: #98989D;
}

.stat-values {
  text-align: right;
}

.stat-main-value {
  font-size: 16px;
  font-weight: 600;
  color: #FFFFFF;
  margin-bottom: 2px;
}

.stat-sub-value {
  font-size: 12px;
  color: #FF8C42;
}

.stat-toggle {
  width: 24px;
  height: 24px;
  color: #98989D;
}
```

### Bottom Input Bar
```css
.bottom-input {
  background: #FFFFFF;
  border-radius: 24px 24px 0 0;
  padding: 16px 20px;
  box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.3);
}

.input-container {
  display: flex;
  align-items: center;
  gap: 12px;
}

.input-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(135deg, #FF8C42 0%, #FF6B35 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #FFFFFF;
}

.input-field {
  flex: 1;
  font-size: 14px;
  color: #1C1C1E;
  border: none;
  background: transparent;
}

.input-field::placeholder {
  color: #98989D;
}

.input-controls {
  display: flex;
  gap: 8px;
}

.input-btn {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: #F2F2F7;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #1C1C1E;
}
```

## Special Effects

### Gradient Definitions
```css
/* Orange Gradient */
.orange-gradient {
  background: linear-gradient(135deg, #FF8C42 0%, #FF6B35 100%);
}

/* Chart Gradient */
#orangeGradient {
  stop-color: rgba(255, 140, 66, 0.3) at 0%;
  stop-color: rgba(255, 140, 66, 0) at 100%;
}

/* Progress Ring Gradient */
#progressGradient {
  stop-color: #FF8C42 at 0%;
  stop-color: #FF6B35 at 100%;
}
```

### Hover States
```css
.interactive:active {
  transform: scale(0.97);
  opacity: 0.8;
}

.card:hover {
  background: #3A3A3C;
  transition: background 0.2s ease;
}
```

### Loading Skeleton
```css
.skeleton {
  background: linear-gradient(
    90deg,
    #2C2C2E 25%,
    #3A3A3C 50%,
    #2C2C2E 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}

@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```

## Icons
- **Style:** SF Symbols / Material Icons
- **Weight:** Regular (2px stroke)
- **Size:** 20px (small), 24px (medium), 32px (large)
- **Color:** White or orange gradient

### Icon List
- Heart (filled) - Health/favorite
- Fire - Calories
- Lightning - Energy
- Clock - Time/duration
- Dumbbell - Workout
- Run - Activity
- Bicycle - Cycling
- Chart - Statistics
- Settings - Gear icon
- Bell - Notifications
- Search - Magnifying glass
- Plus - Add new
- Chevron - Navigation arrows

## Animations
```css
/* Entrance Animation */
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Progress Ring Animation */
@keyframes drawProgress {
  from {
    stroke-dashoffset: var(--circumference);
  }
  to {
    stroke-dashoffset: var(--progress-offset);
  }
}

/* Pulse Animation (for active workouts) */
@keyframes pulse {
  0%, 100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.8;
    transform: scale(1.05);
  }
}
```

## Responsive Breakpoints
- **Small Mobile:** 320px - 374px
- **Mobile:** 375px - 428px (primary)
- **Large Mobile:** 429px - 767px
- **Tablet:** 768px+ (split view or adapted layout)

## Accessibility
- **Contrast Ratio:** Minimum 7:1 for text (WCAG AAA)
- **Touch Targets:** 44px minimum
- **Focus States:** 2px orange outline
- **VoiceOver:** Full ARIA labels
- **Dynamic Type:** Support iOS text scaling
- **Reduced Motion:** Respect prefers-reduced-motion

## Platform-Specific Details

### iOS
- **Status Bar:** 44px height, light content
- **Safe Area:** Respect notch and home indicator
- **Haptics:** Provide feedback on interactions
- **Scrolling:** Natural iOS bounce

### Android
- **Status Bar:** Material theme
- **Navigation:** Material bottom nav or drawer
- **Ripple:** Material ripple effect on tap
- **Elevation:** Use shadows for depth
