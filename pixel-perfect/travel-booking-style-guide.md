# Travel Booking App - Style Guide

## Design Analysis
**Type:** 3D Illustrated Flight Booking Mobile App
**Style:** Soft pastel, isometric 3D elements, glassmorphism
**Orientation:** Dual mobile screens (portrait)

## Color Palette

### Left Screen
- **Background:** `#F5D5B8` (warm peachy beige)
- **Card Background:** `rgba(255, 255, 255, 0.5)` (semi-transparent white)
- **Accent Color:** `#FFB84D` (golden orange)
- **Mountain/Terrain:** `#E8A398`, `#D88F85` (coral/terracotta)
- **Foliage:** `#4ECDC4`, `#3AB8AE` (turquoise)

### Right Screen
- **Background Gradient:** `linear-gradient(180deg, #B8B3E6 0%, #F0B3C1 50%, #6FB8B0 100%)`
- **Card Background:** `rgba(255, 255, 255, 0.2)` (glassmorphic)
- **Water:** `#5FD4C8` (cyan)
- **Beach/Sand:** `#FFD99F` (sand yellow)
- **Mountain:** `#E8A398` (coral)

## Typography
- **Font Family:** 'Inter', 'SF Pro Display', sans-serif
- **Weights:** 300 (light), 400 (regular), 600 (semibold), 700 (bold)
- **Header:** 14px, uppercase, letter-spacing: 2px
- **Flight ID:** 24px, bold
- **Labels:** 11px, light
- **Price:** 20px, semibold

## 3D Elements

### Airplane
- **Position:** Upper third, angled ~25° from horizontal
- **Colors:** Orange gradient body, teal windows
- **Shadow:** Soft drop shadow `0 20px 40px rgba(0,0,0,0.15)`

### Clouds
- **Style:** Soft fluffy, low-poly style
- **Color:** `#FFFFFF` with subtle shadow
- **Size:** Variable (small to medium)

### Terrain/Landscape
- **Mountains:** Layered, isometric style
- **Vegetation:** Stylized palm leaves, tropical plants
- **Texture:** Smooth gradients with subtle highlights

## UI Components

### Header
- **Height:** 60px
- **Elements:**
  - Left: Menu icon (3 lines)
  - Center: "Book Flight" text
  - Right: Cloud/weather icon

### Flight Info Card
- **Background:** Glassmorphic white overlay
- **Blur:** `backdrop-filter: blur(20px)`
- **Border Radius:** 16px
- **Padding:** 20px
- **Shadow:** `0 8px 32px rgba(0,0,0,0.08)`

### Stats Row
- **Layout:** 4 columns, equal width
- **Labels:** Uppercase, 10px, opacity 0.6
- **Values:** 16px, semibold

### Button
- **Primary (Left screen):**
  - Background: `#FFB84D`
  - Border Radius: 24px
  - Height: 48px
  - Icon + Text
  - Shadow: `0 4px 16px rgba(255, 184, 77, 0.3)`

- **Secondary (Right screen):**
  - Background: `#FFB84D`
  - Border Radius: 24px
  - Height: 48px
  - Icon: Bicycle symbol
  - Shadow: Same as primary

### Price Display
- **Font Size:** 24px
- **Color:** `#FFB84D`
- **Position:** Bottom section with stats

### Pagination Dots
- **Active:** `#FFB84D`, 8px diameter
- **Inactive:** `rgba(255,255,255,0.3)`, 6px diameter
- **Spacing:** 8px gap

## Layout Structure

### Screen Layout
- **Aspect Ratio:** 9:19.5 (modern mobile)
- **Width:** 375px
- **Height:** 812px
- **Border Radius:** 40px (device frame)
- **Padding:** 20px

### Content Sections
1. **Header** (60px height)
2. **3D Visual Hero** (450px height)
3. **Flight Info Card** (Auto height, min 200px)
4. **Bottom CTA** (100px height)

## Glassmorphism Effects
```css
.glass-card {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}
```

## Animation Notes
- **Airplane:** Subtle hover/float animation
- **Clouds:** Slow drift motion
- **Button:** Scale on hover (1.02)
- **Card:** Gentle entrance from bottom

## Responsive Breakpoints
- Mobile: 375px - 428px (primary target)
- Tablet: Scale proportionally
- Desktop: Center with max-width constraint

## Accessibility
- Minimum contrast ratio: 4.5:1
- Touch targets: 44px minimum
- Focus states: 2px outline with accent color
- Alt text for all decorative 3D elements

## Icons
- Style: Line icons with 2px stroke
- Size: 24px standard
- Menu/Settings: Hamburger and gear icons
- Weather: Cloud icon
- Navigation: Arrow icons
- Transportation: Airplane, bicycle icons
