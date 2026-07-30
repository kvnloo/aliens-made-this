# Dark Game Character Selection - Style Guide

## Design Analysis
**Type:** Desktop Gaming Character Selection Interface
**Style:** Dark fantasy, cinematic, card-based selection
**Genre:** Horror/Fantasy RPG
**Platform:** Desktop/Tablet landscape

## Color Palette

### Background & Base
- **Primary Background:** `#1A1F1E` (very dark greenish-gray)
- **Secondary Background:** `#242928` (slightly lighter)
- **Card Background:** `rgba(30, 35, 34, 0.85)` (semi-transparent dark)
- **Overlay:** `rgba(0, 0, 0, 0.6)`

### Accent Colors
- **Primary Accent (Red/Orange):** `#FF4D3D` to `#FF6B3D` (gradient)
- **Danger/Alert:** `#FF3333`
- **Selection Border:** `#FF4D3D` with `0 0 20px rgba(255, 77, 61, 0.6)` glow
- **Inactive:** `rgba(255, 255, 255, 0.1)`

### Text Colors
- **Primary Text:** `#FFFFFF`
- **Secondary Text:** `#B8B8B8`
- **Accent Text:** `#FF4D3D`
- **Disabled:** `rgba(255, 255, 255, 0.3)`

### Status Indicators
- **Health:** `#FF4D3D` (red)
- **Magic/Mana:** `#4DFFFF` (cyan)
- **Stamina:** `#FFD700` (gold)

## Typography
- **Font Family:**
  - Headers: 'Cinzel', 'Trajan Pro', serif (fantasy style)
  - Body: 'Inter', 'Roboto', sans-serif
  - Numbers: 'Orbitron', monospace
- **Weights:** 400 (regular), 600 (semibold), 700 (bold)
- **Character Name:** 32px, uppercase, letter-spacing: 3px
- **Class Label:** 14px, uppercase, letter-spacing: 2px
- **Stats:** 16px, semibold
- **Description:** 13px, line-height: 1.6

## Layout Structure

### Main Grid (Desktop 1920x1080)
```
┌─────────────────────────────────────────────────┐
│  [Character List]  │  [Main View]  │  [Stats]   │
│      25%          │      45%      │    30%      │
└─────────────────────────────────────────────────┘
```

### Character List (Left Panel)
- **Width:** 25% viewport
- **Card Height:** 140px
- **Spacing:** 12px gap
- **Scroll:** Vertical overflow

### Main Character Display (Center)
- **Width:** 45% viewport
- **Image:** Full height portrait
- **Title Position:** Top center
- **Character Grid:** Bottom section (2x3 grid)

### Stats Panel (Right Panel)
- **Width:** 30% viewport
- **Card Height:** 100px
- **Layout:** Vertical stack with 16px gaps

## UI Components

### Character Card (List Item)
```css
.character-card {
  background: linear-gradient(135deg, rgba(40, 45, 44, 0.6) 0%, rgba(25, 30, 29, 0.9) 100%);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  padding: 16px;
  backdrop-filter: blur(10px);
}

.character-card.selected {
  border: 2px solid #FF4D3D;
  box-shadow: 0 0 30px rgba(255, 77, 61, 0.4);
}
```

### Stat Card (Right Panel)
```css
.stat-card {
  background: rgba(30, 35, 34, 0.8);
  border: 1px solid rgba(255, 77, 61, 0.2);
  border-radius: 16px;
  padding: 20px;
  position: relative;
}

.stat-card::before {
  /* Red accent corner detail */
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 60px;
  height: 60px;
  background: linear-gradient(135deg, #FF4D3D 0%, transparent 70%);
  border-radius: 16px 0 0 0;
  opacity: 0.3;
}
```

### Avatar/Portrait
- **Size:** 80px (list) / 100px (grid)
- **Border Radius:** 8px (square with rounded corners) or 50% (circle)
- **Border:** 2px solid for selected state
- **Glow:** Box-shadow with character-specific color

### Primary Button (Top Right)
```css
.primary-btn {
  background: linear-gradient(90deg, #FF4D3D 0%, #FF6B3D 100%);
  border: none;
  border-radius: 24px;
  padding: 12px 32px;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  box-shadow: 0 4px 20px rgba(255, 77, 61, 0.4);
  transition: all 0.3s ease;
}

.primary-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 30px rgba(255, 77, 61, 0.6);
}
```

### Tab/Toggle Buttons
```css
.tab-btn {
  background: transparent;
  border: 1px solid rgba(255, 77, 61, 0.3);
  border-radius: 20px;
  padding: 8px 24px;
  color: #B8B8B8;
}

.tab-btn.active {
  background: #FF4D3D;
  color: #FFFFFF;
  border-color: #FF4D3D;
}
```

## Character Attributes Display

### Health/Mana/Stamina Bars
```css
.stat-bar {
  width: 100%;
  height: 8px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 4px;
  overflow: hidden;
  position: relative;
}

.stat-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, #FF4D3D 0%, #FF6B3D 100%);
  transition: width 0.3s ease;
  box-shadow: 0 0 10px currentColor;
}

.stat-bar-fill.health { background: #FF4D3D; }
.stat-bar-fill.mana { background: #4DFFFF; }
.stat-bar-fill.stamina { background: #FFD700; }
```

### Numeric Stats
- **Layout:** Label + Value pair
- **Label:** 12px, opacity 0.6, uppercase
- **Value:** 28px, bold, colored by stat type

## Special Effects

### Glow Effect (Selection/Hover)
```css
.glow {
  animation: pulse-glow 2s ease-in-out infinite;
}

@keyframes pulse-glow {
  0%, 100% { box-shadow: 0 0 20px rgba(255, 77, 61, 0.4); }
  50% { box-shadow: 0 0 40px rgba(255, 77, 61, 0.8); }
}
```

### Character Grid Animation
```css
.character-grid-item {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.character-grid-item:hover {
  transform: scale(1.05);
  filter: brightness(1.2);
}
```

## Icons & Symbols
- **Style:** Minimal line icons with 2px stroke
- **Size:** 20px standard, 32px for large
- **Color:** White with red accent on hover
- **Special:** Faction/class symbols in character corners

## Loading States
```css
.loading-skeleton {
  background: linear-gradient(
    90deg,
    rgba(255, 255, 255, 0.05) 25%,
    rgba(255, 255, 255, 0.1) 50%,
    rgba(255, 255, 255, 0.05) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 2s infinite;
}

@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```

## Responsive Breakpoints
- **Desktop Large:** 1920px+
- **Desktop:** 1440px - 1919px
- **Laptop:** 1024px - 1439px
- **Tablet:** 768px - 1023px (stack to 2 columns)
- **Mobile:** < 768px (single column)

## Accessibility
- **Contrast Ratio:** Minimum 7:1 for text
- **Focus States:** 2px red outline with glow
- **Keyboard Navigation:** Full support with visible indicators
- **Screen Reader:** ARIA labels for all interactive elements
- **Reduced Motion:** Respect prefers-reduced-motion

## Character Portrait Treatment
- **Filter:** `contrast(1.1) saturate(0.9)`
- **Vignette:** Radial gradient overlay
- **Highlights:** Teal/cyan lighting on faces
- **Background:** Dark with atmospheric depth

## Animation Timings
- **Hover:** 0.2s ease-out
- **Selection:** 0.3s cubic-bezier
- **Page Transition:** 0.5s ease-in-out
- **Glow Pulse:** 2s infinite
