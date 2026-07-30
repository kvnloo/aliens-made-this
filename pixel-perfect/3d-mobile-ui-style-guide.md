# 3D Mobile UI - Style Guide

## Color Palette

### Left Card (Orange/Teal Theme)
- **Background Top**: `#FFB366` (warm orange)
- **Background Bottom**: `#1A4D4D` (deep teal)
- **Primary Text**: `#FFFFFF` (white)
- **Secondary Text**: `#B8D4D4` (light cyan)
- **Accent Purple**: `#5E4B8C` (deep purple)
- **Accent Cyan**: `#4ECDC4` (bright cyan)
- **Accent Pink**: `#FF6B9D` (vibrant pink)

### Right Card (Navy/Dark Theme)
- **Background**: `#1B2A3D` (dark navy blue)
- **Secondary Background**: `#2C3E50` (medium navy)
- **Primary Text**: `#FFFFFF` (white)
- **Secondary Text**: `#8B9CB5` (light blue-gray)
- **Accent Green**: `#4ECDC4` (turquoise)
- **Accent Purple**: `#9B88ED` (lavender)
- **Accent Orange**: `#FFB366` (warm orange)

### 3D Sphere Gradients
- **Orange Sphere**: `#FFB366` → `#FF8B5A` → `#E65C3B`
- **Purple Sphere**: `#9B88ED` → `#7B68CD` → `#5E4B8C`
- **Cyan Sphere**: `#4ECDC4` → `#36A89D` → `#2A8478`
- **Pink Sphere**: `#FF6B9D` → `#E85A8A` → `#D14977`

### Color Dots (Bottom)
- **Left Card**: `#FFB366`, `#4ECDC4`, `#FF8B94`, `#FF9966`
- **Right Card**: `#4ECDC4`, `#6B5B8E`, `#FFB366`, (bottom row)

## Typography

### Fonts
- **Primary Font**: `'Inter', sans-serif` (clean, modern)
- **Display Font**: `'Outfit', sans-serif` (for large numbers)
- **Accent Font**: `'Space Grotesk', sans-serif` (for titles)

### Sizes
- **Main Title**: 28px, font-weight: 700, letter-spacing: -0.5px
- **Section Title**: 20px, font-weight: 600
- **Body Text**: 13px, font-weight: 400
- **Small Text**: 11px, font-weight: 500
- **Large Numbers**: 36px, font-weight: 700
- **Medium Numbers**: 24px, font-weight: 600
- **Tab Labels**: 10px, font-weight: 500, uppercase

## Spacing System

- **Base Unit**: 4px
- **Card Padding**: 20px
- **Section Spacing**: 24px
- **Element Gaps**: 12px
- **Card Border Radius**: 32px
- **Button Border Radius**: 20px
- **Sphere Size Range**: 40px - 120px

## Component Styles

### Cards
- **Container**: 340px × 720px
- **Border Radius**: 32px
- **Shadow**: `0 24px 80px rgba(0,0,0,0.4)`
- **3D Depth**: Multiple layered spheres with depth perception

### 3D Spheres
- **Gradient Type**: Radial gradient with highlight
- **Shadow**: `0 8px 24px rgba(0,0,0,0.3)`
- **Highlight**: Top-left positioned white circle at 30% opacity
- **Size Variations**: Small (40px), Medium (80px), Large (120px)

### Buttons
- **Primary**: Rounded pill, solid color, white text
- **Icon Button**: 44px × 44px, circular, glassmorphic
- **Tab Button**: Underline on active, fade on inactive

### Header Bar
- **Height**: 56px
- **Background**: Semi-transparent with backdrop blur
- **Elements**: Menu icon (left), Play button (right)

### Wave/Flow Elements
- **3D Ribbons**: Layered curved shapes with gradients
- **Opacity**: 0.7 - 0.9 for depth
- **Colors**: Match sphere gradient palette
- **Thickness**: 60px - 100px width

### Stats/Info Cards
- **Background**: `rgba(255,255,255,0.05)`
- **Border**: `1px solid rgba(255,255,255,0.1)`
- **Border Radius**: 16px
- **Padding**: 16px
- **Backdrop Blur**: `blur(10px)`

### Color Palette Row
- **Dot Size**: 64px × 64px
- **Border Radius**: 50%
- **Shadow**: `0 6px 16px rgba(0,0,0,0.2)`
- **Gradient**: Radial for 3D effect

### Navigation Tabs
- **Height**: 48px
- **Active Indicator**: 2px bottom border
- **Spacing**: 32px between items
- **Icon Size**: 20px × 20px

## Shadows & Depth

### Card Shadows
- **Primary**: `0 24px 80px rgba(0,0,0,0.4)`
- **Hover**: `0 32px 100px rgba(0,0,0,0.5)`

### Element Shadows
- **Sphere**: `0 8px 24px rgba(0,0,0,0.3)`
- **Button**: `0 4px 12px rgba(0,0,0,0.2)`
- **Card Section**: `0 2px 8px rgba(0,0,0,0.15)`

### 3D Lighting
- **Highlight Position**: Top-left (30deg angle)
- **Shadow Position**: Bottom-right (210deg angle)
- **Ambient Occlusion**: Subtle dark gradient at element edges

## Layout Structure

### Grid System
- **Container**: Single column, centered
- **Max Width**: 340px
- **Vertical Spacing**: 24px between sections

### Z-Index Layers
1. Background (0)
2. Wave elements (1-5)
3. Spheres back (10)
4. Spheres mid (15)
5. Spheres front (20)
6. UI elements (30)
7. Header (40)
8. Modals (50)

## 3D Effects

### Perspective
- **Container**: `perspective: 1200px`
- **Transform Style**: `preserve-3d`

### Sphere 3D Rendering
- **Radial Gradient**:
  - Center highlight: `rgba(255,255,255,0.4)`
  - Mid color: base color
  - Edge shadow: darker variant
- **Position**: 50% 30% (highlight offset top-left)

### Wave/Ribbon 3D
- **Curve Bezier**: Complex cubic-bezier paths
- **Layer Gradient**: Multi-stop with opacity variation
- **Transform**: `rotateX()`, `rotateY()`, `translateZ()`

## Animations

### Hover Effects
- **Spheres**: Float animation (`translateY(-8px)`)
- **Cards**: Subtle tilt on hover (3D perspective shift)
- **Buttons**: Scale (1.05) + brightness increase

### Scroll Animations
- **Parallax**: Spheres move at different speeds
- **Fade In**: Elements appear with opacity 0 → 1
- **Slide In**: `translateX(-20px)` → `translateX(0)`

### Loading States
- **Pulse**: Spheres pulse size (0.95 → 1.05)
- **Rotation**: Slow 360deg rotation on 3D elements
- **Shimmer**: Highlight moves across surface

### Transitions
- **Default**: `all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1)` (elastic)
- **Fast**: `0.2s ease-out`
- **Slow**: `0.6s ease-in-out`

## Glass Morphism

### Standard Glass
- **Background**: `rgba(255,255,255,0.08)`
- **Backdrop Filter**: `blur(12px) saturate(180%)`
- **Border**: `1px solid rgba(255,255,255,0.15)`
- **Shadow**: `0 8px 32px rgba(0,0,0,0.1)`

### Dark Glass
- **Background**: `rgba(0,0,0,0.2)`
- **Backdrop Filter**: `blur(10px)`
- **Border**: `1px solid rgba(255,255,255,0.08)`

## Gradients

### Radial Gradients (Spheres)
```css
radial-gradient(
  circle at 30% 30%,
  rgba(255,255,255,0.4) 0%,
  [base-color] 30%,
  [darker-variant] 100%
)
```

### Linear Gradients (Backgrounds)
```css
linear-gradient(
  180deg,
  [color-1] 0%,
  [color-2] 50%,
  [color-3] 100%
)
```

### Wave Gradients
```css
linear-gradient(
  135deg,
  [color-1] 0%,
  [color-2] 50%,
  [color-3] 100%
)
```

## Accessibility

- **Contrast Ratio**: Minimum 4.5:1 (enhanced to 7:1 for body text)
- **Touch Targets**: Minimum 44px × 44px
- **Focus Visible**: 3px outline with high contrast
- **Reduced Motion**: Disable animations when prefers-reduced-motion

## Responsive Behavior

- **Mobile**: 340px - 480px (base design)
- **Tablet**: Scale spheres proportionally, maintain ratios
- **Desktop**: Center cards, max-width: 420px
- **Landscape**: Adjust sphere positions for wider viewport

## Special Effects

### Particle Systems
- **Small Dots**: 2px - 8px circles scattered
- **Colors**: Accent colors at 20-40% opacity
- **Animation**: Slow float with random delays
- **Count**: 15-25 particles per card

### Glow Effects
- **Sphere Glow**: `box-shadow: 0 0 40px rgba([color], 0.5)`
- **Button Glow**: `box-shadow: 0 0 20px rgba([color], 0.3)`
- **Active State**: Increase glow intensity by 50%

### Noise Texture
- **Overlay**: `filter: url(#noise)` at 5% opacity
- **Blend Mode**: `overlay`
- **Purpose**: Add subtle grain for depth
