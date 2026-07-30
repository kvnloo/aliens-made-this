# Nature Mobile UI - Style Guide

## Color Palette

### Left Card (Teal/Green Theme)
- **Background Gradient**: `#2F4F4F` → `#1C3333` (dark teal)
- **Header Background**: `#E8D5C4` (warm beige)
- **Primary Text**: `#FFFFFF` (white)
- **Secondary Text**: `#B8D4D4` (light teal)
- **Accent Gold**: `#FFB84D` (warm yellow)
- **Plant Green**: `#2D7A6E` (deep teal green)
- **Decorative Elements**: `#FF6B6B` (coral red), `#FF9966` (orange)

### Right Card (Coral/Pink Theme)
- **Background Gradient**: `#F5E6E8` → `#FFFFFF` (soft pink to white)
- **Header Background**: `#FF8B94` (coral pink)
- **Primary Text**: `#2C2C2C` (dark gray)
- **Secondary Text**: `#8B8B8B` (medium gray)
- **Accent Teal**: `#4ECDC4` (turquoise)
- **Purple Leaves**: `#6B5B8E` (muted purple)
- **Cloud Cream**: `#F5E6D3` (warm cream)

### Color Dots (Bottom)
- **Left Card**: `#FF6B6B`, `#FF9966`, `#FFD966`, `#FFEB99`
- **Right Card**: `#FF8B94`, `#9B88ED`, `#4ECDC4`, `#FF9966`

## Typography

### Fonts
- **Primary Font**: `'DM Sans', sans-serif` (geometric, modern)
- **Display Font**: `'Space Grotesk', sans-serif` (for titles)
- **Accent Font**: `'Outfit', sans-serif` (for UI elements)

### Sizes
- **Card Title**: 18px, font-weight: 600
- **Subtitle**: 14px, font-weight: 400
- **Body Text**: 12px, font-weight: 400
- **Small Text**: 10px, font-weight: 500
- **Numbers**: 24px, font-weight: 700

## Spacing System

- **Base Unit**: 4px
- **Card Padding**: 24px
- **Section Spacing**: 16px
- **Element Gaps**: 8px
- **Card Border Radius**: 32px
- **Button Border Radius**: 24px
- **Icon Size**: 20px × 20px

## Component Styles

### Cards
- **Container**: 320px × 640px
- **Border Radius**: 32px
- **Shadow**: `0 20px 60px rgba(0,0,0,0.3)`
- **3D Depth**: Layered elements with subtle shadows

### Buttons
- **Primary Button**: Rounded pill (32px height), gradient background
- **Icon Button**: 40px × 40px, circular, semi-transparent background
- **Hover State**: Scale 1.05, brightness 1.1

### Header Bar
- **Height**: 56px
- **Background**: Semi-transparent with backdrop blur
- **Border Radius**: 24px (top)
- **Elements**: Menu icon (left), Status pill (right)

### Status Pills
- **Border Radius**: 16px
- **Padding**: 6px 12px
- **Font Size**: 11px
- **Background**: Semi-transparent white

### Illustration Cards
- **Height**: 280px
- **Border Radius**: 24px
- **Layered Elements**: Multiple z-index levels for depth
- **Gradients**: Soft, multi-stop linear gradients

### Color Palette Row
- **Dot Size**: 56px × 56px
- **Border Radius**: 50% (perfect circle)
- **Shadow**: `0 4px 12px rgba(0,0,0,0.15)`
- **Spacing**: 12px gap

### Stats Section
- **Layout**: 4-column grid
- **Font Size**: 10px (label), 20px (number)
- **Alignment**: Center-aligned text

## Shadows & Depth

### Card Shadows
- **Elevation 1**: `0 4px 12px rgba(0,0,0,0.08)`
- **Elevation 2**: `0 8px 24px rgba(0,0,0,0.12)`
- **Elevation 3**: `0 20px 60px rgba(0,0,0,0.20)`

### Element Shadows
- **Button**: `0 2px 8px rgba(0,0,0,0.1)`
- **Icon**: `0 2px 6px rgba(0,0,0,0.08)`
- **Illustration Layer**: `0 4px 16px rgba(0,0,0,0.15)`

## Layout Structure

### Grid System
- **Container**: Single column, centered
- **Max Width**: 320px
- **Vertical Rhythm**: 16px baseline grid

### Z-Index Layers
1. Background gradient (0)
2. Illustration base (1)
3. Illustration mid (2)
4. Illustration top (3)
5. UI elements (10)
6. Header (20)
7. Modals (30)

## Animations

### Hover Effects
- **Cards**: Subtle lift (`translateY(-4px)`)
- **Buttons**: Scale (1.05) + shadow increase
- **Icons**: Rotate (5deg) or pulse

### Loading States
- **Skeleton**: Shimmer gradient animation
- **Dots**: Pulse animation (scale 0.8 → 1.2)

### Transitions
- **Default**: `all 0.3s cubic-bezier(0.4, 0, 0.2, 1)`
- **Fast**: `0.15s ease-out`
- **Slow**: `0.5s ease-in-out`

## Accessibility

- **Contrast Ratio**: Minimum 4.5:1 for text
- **Touch Targets**: Minimum 44px × 44px
- **Focus States**: 2px outline with accent color
- **ARIA Labels**: All interactive elements

## Responsive Behavior

- **Mobile**: 320px - 480px (base design)
- **Tablet**: Scale up 1.2x, max-width: 400px
- **Desktop**: Center cards with max-width: 420px

## Special Effects

### Glass Morphism
- **Background**: `rgba(255,255,255,0.1)`
- **Backdrop Filter**: `blur(10px)`
- **Border**: `1px solid rgba(255,255,255,0.2)`

### 3D Elements
- **Transform**: `translateZ()` for depth
- **Perspective**: `1000px` on container
- **Preserve 3D**: `transform-style: preserve-3d`

### Gradients
- **Multi-Stop**: 3-5 color stops
- **Direction**: Typically 135deg - 225deg
- **Opacity Variation**: Layer gradients with varying opacity
