# Isometric 3D Landing Page - Style Guide

## Design Analysis
Dark-themed landing page with vibrant isometric 3D gem/crystal cards and neon gradient accents. Modern, tech-focused aesthetic with card-based layout.

## Color Palette
```css
--bg-dark: #0f1419
--bg-card: #1a1f2e
--accent-pink: #ff0080
--accent-orange: #ff6b35
--accent-cyan: #00d4ff
--accent-purple: #b24bf3
--accent-yellow: #ffd000
--gradient-pink-orange: linear-gradient(135deg, #ff0080 0%, #ff6b35 100%)
--gradient-cyan-blue: linear-gradient(135deg, #00d4ff 0%, #0080ff 100%)
--gradient-purple-pink: linear-gradient(135deg, #b24bf3 0%, #ff0080 100%)
--gradient-yellow-orange: linear-gradient(135deg, #ffd000 0%, #ff6b35 100%)
--text-white: #ffffff
--text-gray: #a0aec0
```

## Typography
- **Heading Font**: 'Space Grotesk', sans-serif
- **Body Font**: 'Inter', sans-serif
- **Monospace**: 'JetBrains Mono', monospace

### Font Sizes
- Card Title: 24px / 1.5rem (Bold)
- Body: 16px / 1rem
- Small: 14px / 0.875rem
- Caption: 12px / 0.75rem

## 3D Isometric Elements
### Crystal/Gem Design
- Faceted geometric shapes
- Vibrant gradient fills
- Neon glow effects
- Floating/suspended appearance
- Multiple gems per card (3-5 pieces)

### Color Combinations
- Card 1: Pink, orange, purple crystals
- Card 2: Orange, yellow gradient gems
- Card 3: Cyan, blue crystals
- Card 4: Pink, cyan, blue gems
- Card 5: Yellow, orange gradient
- Card 6: Multi-color mix

## Layout Structure
- Desktop: Masonry/grid layout (3 columns)
- Cards: Tilted perspective (3D transform)
- Spacing: 24px gaps between cards
- Card padding: 32px
- Border radius: 24px

## Card Components
### Standard Card Structure
- Dark background (#1a1f2e)
- 3D isometric gem illustration (top center)
- Title (white, bold)
- Description text (gray)
- CTA button (gradient, rounded)
- Subtle border/glow effect

### Card Variations
1. **Integer Commodi** - Pink/purple gems
2. **Randomized trials & commerce** - Orange/yellow gem
3. **Quid Earrumet Pasedet** - Cyan card with text content
4. **Lefebvre à discendi & diurnali** - Pink/cyan gems
5. **[Center card]** - Large yellow gem focus
6. **Dignest! Locator Purifactor** - Orange gradient card

## Visual Effects
- Card shadows: 0 20px 60px rgba(0, 0, 0, 0.5)
- Neon glow on gems: box-shadow with color
- 3D transform: rotateX(-5deg) rotateY(5deg)
- Hover: transform scale(1.02)
- Transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1)

## Buttons
- Gradient backgrounds (matches gem colors)
- Border radius: 24px (pill shape)
- Padding: 12px 28px
- Font weight: 600
- Hover: brightness(1.1)

## Background
- Very dark navy (#0f1419)
- Subtle grid or particle effects
- Optional: Faint connecting lines between cards

## Accessibility
- Ensure text contrast on dark cards (4.5:1 minimum)
- Focus states with visible outline
- Alt text for gem illustrations
- Keyboard navigation support
