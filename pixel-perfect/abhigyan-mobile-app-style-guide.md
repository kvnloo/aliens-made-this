# Abhigyan Mobile App - Style Guide

## Color Palette

### Background Colors
- **Primary Background**: `#1A2332` (dark navy blue)
- **Secondary Background**: `#2C3A4F` (medium navy)
- **Card Background**: `#243447` (elevated navy)
- **Overlay Background**: `rgba(26, 35, 50, 0.95)`

### Text Colors
- **Primary Text**: `#FFFFFF` (white)
- **Secondary Text**: `#8B9CB5` (light blue-gray)
- **Muted Text**: `#5A6B7F` (medium blue-gray)
- **Accent Text**: `#FF6B94` (pink), `#4ECDC4` (cyan)

### Gradient Orbs
- **Orange Orb**: `#FFB366` → `#FF8B5A` → `#FF6B94` (orange to pink)
- **Purple Orb**: `#9B88ED` → `#7B68CD` → `#5E4B8C` (lavender to deep purple)
- **Cyan Orb**: `#4ECDC4` → `#36A89D` (bright to deep cyan)
- **Blue Orb**: `#5E8FE8` → `#4B7CD6` (light to medium blue)
- **Coral Orb**: `#FF8B94` → `#E85A8A` (coral to pink)

### Accent Colors
- **Primary Accent**: `#FF6B94` (coral pink)
- **Secondary Accent**: `#4ECDC4` (turquoise)
- **Success**: `#4ECDC4` (cyan)
- **Warning**: `#FFB366` (orange)
- **Error**: `#FF6B94` (pink)

### Chart Colors
- **Line 1**: `#FF6B94` (pink)
- **Line 2**: `#4ECDC4` (cyan)
- **Line 3**: `#FFB366` (orange)
- **Grid Lines**: `rgba(139, 156, 181, 0.1)`

## Typography

### Fonts
- **Primary Font**: `'Inter', sans-serif` (clean, readable)
- **Display Font**: `'Space Grotesk', sans-serif` (for titles)
- **Monospace**: `'JetBrains Mono', monospace` (for numbers/data)

### Font Sizes
- **App Title**: 20px, font-weight: 600
- **Section Title**: 16px, font-weight: 600
- **Card Title**: 14px, font-weight: 500
- **Body Text**: 13px, font-weight: 400
- **Small Text**: 11px, font-weight: 400
- **Large Numbers**: 32px, font-weight: 700
- **Medium Numbers**: 18px, font-weight: 600
- **Chart Labels**: 10px, font-weight: 500

### Line Heights
- **Headings**: 1.2
- **Body**: 1.5
- **Compact**: 1.3

### Letter Spacing
- **Headings**: -0.5px
- **Body**: 0px
- **Numbers**: -0.3px
- **Labels**: 0.5px (uppercase)

## Spacing System

- **Base Unit**: 4px
- **Card Padding**: 20px
- **Section Spacing**: 24px
- **Element Gaps**: 12px
- **Status Bar Height**: 44px
- **Bottom Nav Height**: 80px
- **Card Border Radius**: 20px
- **Button Border Radius**: 12px
- **Orb Size Range**: 60px - 140px

## Component Styles

### Cards
- **Container**: 375px × 812px (iPhone X dimensions)
- **Outer Border Radius**: 40px (device frame)
- **Content Padding**: 20px
- **Shadow**: `0 20px 60px rgba(0,0,0,0.6)`

### Status Bar
- **Height**: 44px
- **Background**: Transparent
- **Time**: 13px, white, font-weight: 600
- **Icons**: Signal, WiFi, Battery (white)
- **Padding**: 16px horizontal

### Gradient Orbs
- **Gradient Type**: Radial gradient with highlight
- **Glow Effect**: `0 0 60px rgba([color], 0.4)`
- **Shadow**: `0 12px 40px rgba(0,0,0,0.3)`
- **Highlight**: Top-left positioned at 25% 25%
- **Size Variations**:
  - Large: 140px
  - Medium: 80px
  - Small: 60px

### Info Cards
- **Background**: `rgba(255,255,255,0.04)`
- **Border**: `1px solid rgba(255,255,255,0.08)`
- **Border Radius**: 16px
- **Padding**: 16px
- **Backdrop Blur**: `blur(20px)`

### Color Dots (Navigation)
- **Size**: 56px × 56px
- **Border Radius**: 50%
- **Shadow**: `0 4px 16px rgba(0,0,0,0.2)`
- **Gradient**: Radial for 3D depth effect
- **Active State**: Scale 1.1, increased glow

### Charts
- **Line Width**: 2px
- **Point Size**: 6px
- **Grid Opacity**: 0.1
- **Fill Gradient**: `rgba([color], 0.2)` to transparent

### Buttons
- **Primary**: Solid color, white text, 48px height
- **Icon Button**: 40px × 40px, circular, glassmorphic
- **Tab Button**: 32px height, rounded pill when active

### Icon Buttons (Right Side)
- **Container**: 56px × 56px
- **Background**: `rgba(255,255,255,0.08)`
- **Border**: `1px solid rgba(255,255,255,0.12)`
- **Icon Size**: 24px × 24px
- **Border Radius**: 16px

## Shadows & Depth

### Card Shadows
- **Primary**: `0 20px 60px rgba(0,0,0,0.6)`
- **Elevated**: `0 30px 80px rgba(0,0,0,0.7)`

### Element Shadows
- **Orb**: `0 12px 40px rgba(0,0,0,0.3)`
- **Button**: `0 4px 16px rgba(0,0,0,0.2)`
- **Chart**: `0 2px 12px rgba(0,0,0,0.15)`

### Glow Effects
- **Orb Glow**: `0 0 60px rgba([color], 0.4)`
- **Active Glow**: `0 0 40px rgba([color], 0.5)`
- **Subtle Glow**: `0 0 20px rgba([color], 0.2)`

## Layout Structure

### Grid System
- **Container**: 375px width (iPhone X)
- **Safe Area**: Respects top/bottom notch areas
- **Padding**: 20px horizontal
- **Content Max Width**: 335px

### Z-Index Layers
1. Background (0)
2. Background orbs (1)
3. Chart layer (5)
4. Cards/Content (10)
5. Floating orbs (15)
6. Navigation (20)
7. Status bar (30)
8. Modals (40)

## 3D Orb Effects

### Gradient Formula
```css
radial-gradient(
  circle at 25% 25%,
  rgba(255,255,255,0.5) 0%,
  [base-color-light] 15%,
  [base-color] 40%,
  [base-color-dark] 100%
)
```

### Glow Formula
```css
filter: drop-shadow(0 0 60px rgba([r],[g],[b], 0.4));
box-shadow:
  0 12px 40px rgba(0,0,0,0.3),
  0 0 60px rgba([color], 0.4),
  inset 0 0 20px rgba(255,255,255,0.1);
```

### Highlight Overlay
- **Position**: Top-left quarter
- **Size**: 40% of orb diameter
- **Gradient**: `radial-gradient(circle, rgba(255,255,255,0.6), transparent)`
- **Blur**: `blur(2px)` for soft edge

## Charts & Data Visualization

### Line Chart
- **Background**: `rgba(255,255,255,0.02)`
- **Grid**: Horizontal lines at `rgba(139,156,181,0.1)`
- **Lines**: 2px stroke, smooth curves
- **Points**: 6px circles on data points
- **Gradient Fill**: Area under curve with opacity 0.2 → 0

### Wave Chart (Top of Second Screen)
- **Line Width**: 3px
- **Colors**: Multi-colored segments
- **Animation**: Subtle wave motion
- **Glow**: `0 0 20px rgba([color], 0.3)` on line

### Stats Display
- **Large Number**: 32px, bold, white
- **Label**: 11px, muted color, uppercase
- **Change Indicator**: `+/-` with green/red color
- **Percentage**: 13px, accent color

## Glass Morphism

### Standard Glass
- **Background**: `rgba(255,255,255,0.04)`
- **Backdrop Filter**: `blur(20px) saturate(150%)`
- **Border**: `1px solid rgba(255,255,255,0.08)`
- **Shadow**: `0 8px 32px rgba(0,0,0,0.1)`

### Dark Glass (Inverted)
- **Background**: `rgba(0,0,0,0.2)`
- **Backdrop Filter**: `blur(16px)`
- **Border**: `1px solid rgba(255,255,255,0.06)`

### Frosted Glass (Heavy)
- **Background**: `rgba(255,255,255,0.06)`
- **Backdrop Filter**: `blur(30px) saturate(180%)`
- **Border**: `1px solid rgba(255,255,255,0.12)`

## Animations

### Orb Animations
- **Float**: Subtle `translateY()` oscillation (±8px)
- **Rotation**: Slow 360deg rotation (60s duration)
- **Pulse**: Scale 0.95 → 1.05 (3s duration)
- **Glow Pulse**: Glow intensity variation

### Chart Animations
- **Line Draw**: Path length animation on mount
- **Point Appear**: Scale 0 → 1 with stagger
- **Hover**: Point scale 1 → 1.5

### UI Transitions
- **Page**: Slide in from right (0.4s)
- **Card**: Fade + slide up (0.3s)
- **Button**: Scale + glow (0.2s)

### Micro-interactions
- **Button Press**: Scale 0.95
- **Tab Switch**: Slide indicator + fade content
- **Scroll**: Parallax effect on background orbs

## Accessibility

### Contrast
- **Text on Dark**: Minimum 7:1 ratio
- **Interactive Elements**: Minimum 4.5:1
- **Charts**: Distinct color combinations

### Touch Targets
- **Minimum Size**: 44px × 44px
- **Spacing**: 8px minimum between targets
- **Active Area**: Extends 4px beyond visible bounds

### Focus States
- **Outline**: 2px solid accent color
- **Offset**: 2px from element
- **Contrast**: 3:1 minimum against background

### Motion
- **Respect `prefers-reduced-motion`**
- **Disable float/pulse animations**
- **Keep essential transitions only**

## Responsive Behavior

### Mobile Portrait (Base)
- **Width**: 375px (iPhone X)
- **Height**: 812px
- **Safe Areas**: Top (44px), Bottom (34px)

### Mobile Landscape
- **Adjust orb positions**
- **Reduce spacing**
- **Stack navigation horizontally**

### Tablet
- **Max Width**: 768px
- **Center content**
- **Increase padding to 32px**

## Special Effects

### Particle System
- **Small Stars**: 2px circles, white at 20% opacity
- **Count**: 30-40 particles
- **Animation**: Twinkle (opacity fade)
- **Distribution**: Random across viewport

### Noise Texture
- **Overlay**: SVG noise filter at 3% opacity
- **Blend Mode**: `overlay`
- **Grain Size**: 1px - 2px

### Gradient Mesh
- **Background**: Multi-point radial gradients
- **Colors**: Primary orb colors at 5% opacity
- **Blend Mode**: `screen`
- **Animation**: Slow morphing (30s cycle)

## Data Display Patterns

### Currency Format
- **Large**: `$205.30` (32px, bold)
- **Small**: `$20.5` (18px, medium)
- **Decimals**: Same size but muted color

### Percentage Display
- **Format**: `+12%` or `-3%`
- **Color**: Green (positive), Red (negative)
- **Font**: Monospace for alignment

### Time/Date
- **Format**: `15:41` (status bar), `Oct 1` (labels)
- **Font**: System, 13px
- **Color**: Secondary text color

### Labels
- **Transform**: `uppercase`
- **Letter Spacing**: `0.5px`
- **Font Size**: 10px
- **Color**: Muted text
