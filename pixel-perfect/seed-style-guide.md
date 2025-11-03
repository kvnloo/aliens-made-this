# Seed.com Style Guide

## Overview
Seed is a sophisticated health and wellness brand with a nature-inspired design system. The design emphasizes deep greens, organic shapes, and a premium feel through careful typography and spacing.

## Color Palette

### Primary Brand Colors
- **Seed Green (Primary)**: `#1c3a13` - Main brand color, navigation, CTAs
- **Seed Green Hover**: `#334e2b` - Interactive hover states
- **Seed Green Pressed**: `#162e0f` - Active/pressed states
- **Seed Green Active**: `#142f0c` - Active navigation items
- **Seed Green Card**: `#45663c` - Card backgrounds on green sections
- **Seed Green Faded**: `rgba(28, 58, 19, 0.5)` - Transparent overlays

### Secondary Greens
- **Moss Root**: `#3d5b34` - Secondary brand accent
- **Olive Green**: `#61735e` - Tertiary elements
- **Micronav Green**: `#58644c` - Small navigation elements

### Background Colors
- **Snow White**: `#fcfcf7` - Main background
- **Yellowish White**: `#f6f7ef` - Alternate sections
- **Foam White**: `#eff1e4` - Card backgrounds
- **Lemongrass**: `#e9f0ca` - Accent backgrounds
- **Asparagus Green**: `#d0d9b9` - Secondary buttons
- **Asparagus Green Hover**: `#d9e1c7` - Button hover
- **Asparagus Green Pressed**: `#bbc3a6` - Button pressed
- **Fluorescent Green**: `#d3fa99` - Accent highlights

### Frosted Glass Effects
- **Frosted Glass T55**: `rgba(87, 94, 85, 0.55)` - Medium transparency
- **Frosted Glass T35**: `rgba(87, 94, 85, 0.35)` - Light transparency
- **Frosted Glass T8**: `rgba(87, 94, 85, 0.08)` - Very light transparency

### Utility Colors
- **Black**: `#000000`
- **White**: `#ffffff`
- **Snow White Focus**: `#fcfcf780` - Focus states with transparency
- **Seed Green T5**: `rgba(28, 58, 19, 0.05)` - Very light tint
- **Seed Green T20**: `rgba(28, 58, 19, 0.2)` - Light tint

### Button States
- **Primary BG**: `#1c3a13` (seedgreen)
- **Primary BG Hover**: `#334e2b`
- **Primary BG Pressed**: `#162e0f`
- **Primary Text**: `#fcfcf7` (snowwhite)
- **Secondary BG**: `#d0d9b9` (asparagusgreen)
- **Secondary BG Hover**: `#d9e1c7`
- **Secondary BG Pressed**: `#bbc3a6`
- **Secondary Text**: `#1c3a13` (seedgreen)
- **Disabled BG**: `#d3d3d3`
- **Disabled Text**: `#9ca599`

## Typography

### Font Family
- **Primary Font**: `'SeedSans', Helvetica, sans-serif`
- All text uses SeedSans as the primary typeface

### Font Weights
- **Regular**: `400` - Body text, descriptions
- **Medium**: `500` - Navigation, subheadings
- **Semibold**: `600` - Buttons, important labels
- **Bold**: `700` - Main headings, emphasis

### Letter Spacing
- **Tight (-1%)**: `-0.01em` - Headings
- **Tighter (-2%)**: `-0.02em` - Large display text
- **Normal**: `0` - Body text

### Line Height
- **Default**: `1.5` - Most text elements
- **Tight**: `1.2` - Large headings
- **Relaxed**: `1.75` - Long-form content

## Spacing System

### Fixed Spacing (Always Same Size)
- **fixed-1**: `0.5rem` (8px)
- **fixed-2**: `1rem` (16px)
- **fixed-2-5**: `1.25rem` (20px)
- **fixed-3**: `1.5rem` (24px)
- **fixed-3-5**: `1.75rem` (28px)
- **fixed-4**: `2rem` (32px)
- **fixed-4-5**: `2.25rem` (36px)
- **fixed-5**: `2.5rem` (40px)
- **fixed-6**: `3.5rem` (56px)

### Responsive Spacing (Changes at 37.5em breakpoint)

#### Mobile (< 37.5em / 600px)
- **space-1**: `0.5rem` (8px)
- **space-2**: `1rem` (16px)
- **space-3**: `1.5rem` (24px)
- **space-4**: `2rem` (32px)
- **space-5**: `4rem` (64px)
- **space-6**: `5rem` (80px)

#### Desktop (≥ 37.5em / 600px)
- **space-1**: `1rem` (16px)
- **space-2**: `1.5rem` (24px)
- **space-3**: `2rem` (32px)
- **space-4**: `2.5rem` (40px)
- **space-5**: `4.5rem` (72px)
- **space-6**: `6rem` (96px)

### Layout Spacing
- **space-gutter**: `1.25rem` (20px) - Column gap
- **space-gutter-s**: `0.625rem` (10px) - Half gutter
- **space-outer**: `1rem` (16px) - Horizontal page margin (mobile: 16px, desktop: 24px)
- **space-outer-v**: `5rem` (80px) - Vertical section padding (mobile: 80px, desktop: 96px)
- **space-inner**: `1rem` (16px) - Component padding (mobile: 16px, desktop: 24px)
- **space-inner-v**: `1.5rem` (24px) - Vertical component padding (mobile: 24px, desktop: 32px)

### Navigation Heights
- **nav-height**: `3rem` (48px) - Main navigation bar
- **banner-height**: `2.5rem` (40px) - Top announcement banner

## Border Radius

### Sizes
- **Small (s)**: `0.5rem` (8px) - Small elements, tags
- **Small-Medium (sm)**: `0.75rem` (12px) - Input fields
- **Medium (m)**: `1rem` (16px) - Cards, buttons
- **Large (l)**: `2rem` (32px) - Large sections, hero cards
- **Pill**: `99em` - Fully rounded pills, badges

### Usage
- Buttons: `99px` (pill shape)
- Cards: `1rem` (16px)
- Product images: `1rem` (16px)
- Hero sections: `2rem` (32px)
- Input fields: `0.75rem` (12px)

## Grid System

### Breakpoints
- **Mobile**: `< 37.5em` (600px) - 4 columns
- **Desktop**: `≥ 37.5em` (600px) - 8 columns

### Grid Configuration
```css
/* Mobile */
--space-columns: 4;
--grid: repeat(4, minmax(0, 1fr));

/* Desktop (≥600px) */
--space-columns: 8;
--grid: repeat(8, minmax(0, 1fr));
```

### Max Widths
- **Extra Narrow (xn)**: `40.8125rem` (653px)
- **Narrow (n)**: `55.3125rem` (885px)
- **Wide (w)**: `68.75rem` (1100px)
- **Max (maw)**: `90rem` (1440px) - Content container max width

## Transitions

### Default Transition
```css
--trs-prop: all;
--trs-time: 0.3s;
--trs-tfunc: ease-in-out;
--trs: all 0.3s ease-in-out;
```

### Common Usage
- Hover states: `0.3s ease-in-out`
- Button interactions: `0.3s ease-in-out`
- Color changes: `0.3s ease-in-out`

## Component Patterns

### Buttons

#### Primary Button
```css
background: #1c3a13; /* seedgreen */
color: #fcfcf7; /* snowwhite */
border-radius: 99px; /* pill */
padding: 14px 32px;
font-weight: 600;
transition: all 0.3s ease-in-out;

/* Hover */
background: #334e2b; /* seedgreen-hover */

/* Pressed */
background: #162e0f; /* seedgreen-pressed */
```

#### Secondary Button
```css
background: #d0d9b9; /* asparagusgreen */
color: #1c3a13; /* seedgreen */
border-radius: 99px;
padding: 14px 32px;
font-weight: 600;

/* Hover */
background: #d9e1c7; /* asparagusgreen-hover */

/* Pressed */
background: #bbc3a6; /* asparagusgreen-pressed */
```

### Product Cards
```css
background: #fcfcf7; /* snowwhite */
border-radius: 1rem;
padding: 2rem;
/* On green sections */
background: #45663c; /* seedgreen-card */
```

### Navigation
```css
height: 3rem; /* 48px */
background: rgba(87, 94, 85, 0.95); /* frosted glass */
backdrop-filter: blur(12px);
position: sticky;
top: 0;
z-index: 1000;
```

## Tailwind CSS Mappings

### Color Classes
```css
/* Backgrounds */
bg-[#1c3a13] → Primary green
bg-[#fcfcf7] → Snow white
bg-[#d0d9b9] → Asparagus green (secondary button)
bg-[#f6f7ef] → Yellowish white (sections)

/* Text */
text-[#1c3a13] → Primary text color
text-[#fcfcf7] → White text on dark backgrounds
```

### Spacing Classes
```css
/* Mobile base, desktop adjusted */
p-4 → 1rem mobile, 1rem desktop (space-outer)
py-20 → 5rem mobile, 6rem desktop (space-outer-v)
gap-5 → 1.25rem (space-gutter)
```

### Border Radius
```css
rounded-lg → 1rem (cards, buttons)
rounded-2xl → 2rem (hero sections)
rounded-full → 99em (pills, badges)
```

## Example Components

### Hero Section
```html
<section class="bg-[#1c3a13] text-[#fcfcf7] py-20 px-4">
  <div class="max-w-[90rem] mx-auto">
    <h1 class="text-4xl md:text-6xl font-bold mb-6" style="letter-spacing: -0.02em;">
      The probiotic pioneering<br>the future of gut health.
    </h1>
    <button class="bg-[#fcfcf7] text-[#1c3a13] px-8 py-3.5 rounded-full font-semibold hover:bg-white transition-all">
      Shop Now
    </button>
  </div>
</section>
```

### Product Card
```html
<div class="bg-[#fcfcf7] rounded-2xl p-8">
  <img src="product.jpg" alt="Product" class="w-full aspect-square rounded-2xl mb-6">
  <h3 class="text-xl font-semibold mb-2">Daily Synbiotic</h3>
  <p class="text-sm mb-4">For digestive and gut health</p>
  <button class="w-full bg-[#1c3a13] text-[#fcfcf7] py-3 rounded-full font-semibold hover:bg-[#334e2b] transition-all">
    Shop Now
  </button>
</div>
```

### Navigation
```html
<nav class="fixed top-0 w-full h-12 bg-[rgba(87,94,85,0.95)] backdrop-blur-md z-50">
  <div class="max-w-[90rem] mx-auto px-4 h-full flex items-center justify-between">
    <div class="text-[#fcfcf7] font-semibold">Seed</div>
    <div class="flex gap-6">
      <a href="#" class="text-[#fcfcf7] hover:opacity-80 transition-opacity">Shop</a>
      <a href="#" class="text-[#fcfcf7] hover:opacity-80 transition-opacity">Science</a>
      <a href="#" class="text-[#fcfcf7] hover:opacity-80 transition-opacity">About</a>
    </div>
    <button class="bg-[#fcfcf7] text-[#1c3a13] px-6 py-2 rounded-full text-sm font-semibold">
      Account
    </button>
  </div>
</nav>
```

## Accessibility

- **Contrast**: All text meets WCAG AA (4.5:1 for normal text)
- **Focus States**: Visible focus rings on interactive elements
- **Touch Targets**: Minimum 44×44px (3rem minimum for buttons)
- **Font Smoothing**: `-webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale;`

## Performance

- **Font Display**: Use `font-display: swap` for SeedSans
- **Backdrop Filter**: `blur(12px)` for navigation
- **Transitions**: Keep to 0.3s for smooth performance
- **Responsive Images**: Use appropriate sizes for mobile/desktop
