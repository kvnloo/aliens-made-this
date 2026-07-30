# Fishing/Finance Dashboard - Style Guide

## Design Analysis
**Type:** Financial Dashboard / Analytics App (Note: Original filename suggests fishing, but content shows financial dashboard)
**Style:** Clean, minimal, modern glassmorphism
**Platform:** Desktop/Tablet (1280x800 landscape)
**Theme:** Light mode with soft neutrals and sage green accents

## Color Palette

### Primary Colors
- **Background:** `#E8E6E1` (warm off-white/beige)
- **Card Background:** `rgba(255, 255, 255, 0.7)` (semi-transparent white)
- **Primary Accent:** `#6B9B8C` (sage green)
- **Secondary Accent:** `#8FA99E` (light sage)

### Text Colors
- **Primary Text:** `#2D3436` (almost black)
- **Secondary Text:** `#636E72` (medium gray)
- **Label Text:** `#95A5A6` (light gray)
- **Accent Text:** `#6B9B8C` (sage green)

### Status Colors
- **Positive:** `#6B9B8C` (sage green)
- **Negative:** `#E17055` (coral)
- **Neutral:** `#636E72` (gray)
- **Warning:** `#FDCB6E` (gold)

### UI Elements
- **Border:** `rgba(0, 0, 0, 0.08)`
- **Divider:** `rgba(0, 0, 0, 0.05)`
- **Shadow:** `0 8px 32px rgba(0, 0, 0, 0.06)`

## Typography
- **Font Family:**
  - Primary: 'Inter', 'SF Pro Display', -apple-system, sans-serif
  - Numbers: 'SF Mono', 'Roboto Mono', monospace
- **Weights:** 300 (light), 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Heading (Page Title):** 28px, weight 700
- **Subheading:** 18px, weight 600
- **Card Title:** 16px, weight 600
- **Body:** 14px, weight 400
- **Caption:** 12px, weight 400
- **Large Numbers:** 32px, weight 700
- **Small Numbers:** 14px, weight 500

## Layout Structure

### Grid System
```
┌──────────────────────────────────────────────────┐
│ [Sidebar]  │  [Main Dashboard Content]          │
│   140px   │          Remaining Space            │
└──────────────────────────────────────────────────┘
```

### Main Content Grid
- **Columns:** CSS Grid with auto-fit
- **Min Width:** 280px per card
- **Gap:** 20px
- **Padding:** 32px

### Sidebar
- **Width:** 140px
- **Background:** `rgba(255, 255, 255, 0.5)`
- **Icons:** 32px, centered
- **Active Indicator:** 4px rounded pill on left edge

## UI Components

### Glassmorphism Cards
```css
.glass-card {
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.8);
  border-radius: 20px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.06);
  padding: 24px;
}
```

### Chart Elements
- **Line Graph:** Smooth curves with gradient fill
- **Donut Chart:** 80% completion indicator
- **Mini Sparklines:** Compact trend indicators

## Icons & Interactions
- **Icon Style:** Line icons, 24px
- **Hover Effects:** Subtle lift and shadow increase
- **Transitions:** 0.2s ease for smooth animations

## Responsive Breakpoints
- **Desktop:** 1280px+
- **Laptop:** 1024px - 1279px
- **Tablet:** 768px - 1023px (2 column grid)
- **Mobile:** < 768px (single column, hide sidebar)

## Accessibility
- **Contrast Ratio:** Minimum 4.5:1
- **Focus States:** 2px outline with accent color
- **Touch Targets:** 44px minimum
