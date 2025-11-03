# Seed.com Design System - Comprehensive Style Guide

## Overview
Seed's design system embodies a nature-inspired, health-focused brand identity with deep greens, organic shapes, and premium typography. The system emphasizes scientific credibility while maintaining approachability through carefully balanced visual elements.

## Color Palette

### Primary Brand Colors
| Color Name | Hex Code | CSS Variable | Usage |
|------------|----------|--------------|-------|
| **Seed Green** | `#1c3a13` | `--color-seedgreen` | Primary brand color, CTAs, text |
| **Seed Green Hover** | `#334e2b` | `--color-seedgreen-hover` | Button hover states |
| **Seed Green Pressed** | `#162e0f` | `--color-seedgreen-pressed` | Button active/pressed states |
| **Seed Green Active** | `#142f0c` | `--color-seedgreen-active` | Active navigation items |
| **Seed Green Card** | `#45663c` | `--color-seedgreen-card` | Card backgrounds on dark sections |
| **Seed Green Faded** | `rgba(28, 58, 19, 0.5)` | `--color-seedgreen-faded` | Transparent overlays |

### Secondary Green Palette
| Color Name | Hex Code | CSS Variable | Usage |
|------------|----------|--------------|-------|
| **Moss Root** | `#3d5b34` | `--color-moss-root` | Secondary accents |
| **Olive Green** | `#61735e` | `--color-olive-green` | Tertiary elements |
| **Micronav Green** | `#58644c` | `--color-micronav-green` | Small UI elements |

### Neutral & Background Colors
| Color Name | Hex Code | CSS Variable | Usage |
|------------|----------|--------------|-------|
| **Snow White** | `#fcfcf7` | `--color-snowwhite` | Primary background, button text |
| **Yellowish White** | `#f6f7ef` | `--color-yellowish-white` | Alternate section backgrounds |
| **Foam White** | `#eff1e4` | `--color-foam-white` | Card backgrounds |
| **Lemongrass** | `#e9f0ca` | `--color-lemongrass` | Accent backgrounds |

### Accent Colors
| Color Name | Hex Code | CSS Variable | Usage |
|------------|----------|--------------|-------|
| **Asparagus Green** | `#d0d9b9` | `--color-asparagusgreen` | Secondary buttons, highlights |
| **Asparagus Green Hover** | `#d9e1c7` | `--color-asparagusgreen-hover` | Secondary button hover |
| **Asparagus Green Pressed** | `#bbc3a6` | `--color-asparagusgreen-pressed` | Secondary button pressed |
| **Fluorescent Green** | `#d3fa99` | `--color-fluorescent-green` | Accent highlights |

### Frosted Glass Effects
| Color Name | Value | CSS Variable | Usage |
|------------|-------|--------------|-------|
| **Frosted Glass T55** | `rgba(87, 94, 85, 0.55)` | `--color-frosted-glass-t55` | Medium transparency overlays |
| **Frosted Glass T35** | `rgba(87, 94, 85, 0.35)` | `--color-frosted-glass-t35` | Light transparency |
| **Frosted Glass T8** | `rgba(87, 94, 85, 0.08)` | `--color-frosted-glass-t8` | Very light tint |

## Typography

### Font Family
**Primary Font**: Inter
**Fallback Stack**: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif`
**CSS Variable**: `--font-sans`

```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
```

### Font Weights
| Weight | Value | Usage |
|--------|-------|-------|
| **Regular** | `400` | Body text, descriptions |
| **Medium** | `500` | Navigation, subheadings |
| **Semibold** | `600` | Buttons, labels, product names |
| **Bold** | `700` | Headings, emphasis |

### Typography Scale

#### Headings
```css
/* H1 - Hero Headlines */
font-size: 3rem (48px) mobile, 3.75rem (60px) desktop;
font-weight: 700;
letter-spacing: -0.02em;
line-height: 1.1;

/* H2 - Section Headers */
font-size: 2.5rem (40px);
font-weight: 700;
line-height: 1.2;

/* H3 - Product Names */
font-size: 1.25rem (20px);
font-weight: 600;
line-height: 1.4;
```

#### Body Text
```css
/* Large Body */
font-size: 1.125rem (18px);
line-height: 1.6;

/* Regular Body */
font-size: 1rem (16px);
line-height: 1.5;

/* Small Text */
font-size: 0.875rem (14px);
line-height: 1.5;
```

### Text Treatment
- **Antialiasing**: `-webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale;`
- **Tight Letter Spacing**: `-0.02em` for large headings
- **Opacity for Hierarchy**: `opacity: 0.8` for secondary text, `opacity: 0.9` for body on dark backgrounds

## Spacing System

### Base Spacing Variables
| Variable | Value | Usage |
|----------|-------|-------|
| `--space-gutter` | `1.25rem` (20px) | Grid gap between items |
| `--space-outer` | `1rem` (16px) mobile, `1.5rem` (24px) desktop | Horizontal page margins |
| `--space-outer-v` | `5rem` (80px) mobile, `6rem` (96px) desktop | Vertical section padding |
| `--space-inner` | `1rem` (16px) mobile, `1.5rem` (24px) desktop | Component padding |
| `--space-inner-v` | `1.5rem` (24px) mobile, `2rem` (32px) desktop | Vertical component padding |

### Section Spacing
```css
/* Standard Section Padding */
padding: 5rem 1rem; /* py-20 px-4 in Tailwind */

/* Desktop Section Padding */
@media (min-width: 768px) {
    padding: 6rem 1.5rem;
}
```

### Component Spacing
- **Product Cards**: `padding: 2rem` (32px)
- **Button Padding**: `padding: 14px 32px`
- **Grid Gap**: `gap: 1.5rem` (24px)
- **Footer Padding**: `padding: 4rem 1rem`

### Responsive Breakpoint
```css
@media (min-width: 37.5em) { /* 600px */
    /* Desktop spacing increases */
}
```

## Border Radius

| Variable | Value | Usage |
|----------|-------|-------|
| `--bdrs-pill` | `99em` | Fully rounded buttons, pills |
| `--bdrs-s` | `0.5rem` (8px) | Small elements |
| `--bdrs-sm` | `0.75rem` (12px) | Input fields |
| `--bdrs-m` | `1rem` (16px) | Cards, small images |
| `--bdrs-l` | `2rem` (32px) | Hero sections, product images |

### Component Border Radius
- **Buttons**: `99em` (pill shape)
- **Product Cards**: `2rem` (32px)
- **Product Images**: `2rem` (32px)
- **Navigation Container**: Varies
- **Input Fields**: `0.75rem` (12px) for newsletter, `99em` for search/signup

## Component Patterns

### 1. Navigation Bar
```css
.nav-frosted {
    background: rgba(87, 94, 85, 0.95);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    position: sticky;
    top: 0;
    z-index: 1000;
    height: 3rem; /* --nav-height */
}
```

**Key Features**:
- Frosted glass effect with 95% opacity
- 12px backdrop blur
- Sticky positioning at top
- White text with 80% opacity on hover
- White CTA button with seedgreen text

### 2. Primary Button
```css
.btn-primary {
    background: #1c3a13;
    color: #fcfcf7;
    border-radius: 99em;
    padding: 14px 32px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
    background: #334e2b;
}

.btn-primary:active {
    background: #162e0f;
}
```

**States**:
- **Default**: Seedgreen background, snowwhite text
- **Hover**: Lighter green (#334e2b)
- **Active/Pressed**: Darker green (#162e0f)
- **Transition**: 0.3s ease-in-out

### 3. Secondary Button
```css
.btn-secondary {
    background: #d0d9b9;
    color: #1c3a13;
    border-radius: 99em;
    padding: 14px 32px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
}

.btn-secondary:hover {
    background: #d9e1c7;
}

.btn-secondary:active {
    background: #bbc3a6;
}
```

**States**:
- **Default**: Asparagus green background, seedgreen text
- **Hover**: Lighter asparagus (#d9e1c7)
- **Active/Pressed**: Darker asparagus (#bbc3a6)

### 4. Product Card
```css
.product-card {
    background: #fcfcf7;
    border-radius: 2rem;
    padding: 2rem;
    transition: all 0.3s ease-in-out;
}

.product-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(28, 58, 19, 0.1);
}

.product-card img {
    border-radius: 2rem;
    width: 100%;
    aspect-ratio: 1;
    object-fit: cover;
}
```

**Features**:
- Large border radius (2rem)
- Hover lift effect (-4px vertical translation)
- Subtle shadow on hover with seedgreen tint
- Square aspect ratio images
- 2rem padding around content

### 5. Hero Section
**Layout**: Two-column grid (1 col mobile, 2 cols desktop)
**Gap**: 3rem (48px)
**Alignment**: Vertically centered

**Typography**:
- H1: 3rem mobile → 3.75rem desktop
- Letter spacing: -0.02em
- Line height: 1.1
- Body: 1.125rem with 80% opacity

### 6. Footer
```css
footer {
    background: #1c3a13;
    color: #fcfcf7;
    padding: 4rem 1rem;
}

footer a {
    color: #fcfcf7;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

footer a:hover {
    opacity: 0.8;
}
```

**Structure**:
- 4-column grid on desktop (1 col mobile)
- Seedgreen background
- Snowwhite text
- Newsletter input with transparent background and white borders
- Bottom border separator at 20% opacity

### 7. Newsletter Input (Footer Version)
```css
.newsletter-input {
    background: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 0.75rem;
    padding: 12px 16px;
    color: #fcfcf7;
    width: 100%;
}

.newsletter-input::placeholder {
    color: rgba(255, 255, 255, 0.6);
}
```

## Layout System

### Container
```css
.container {
    max-width: 90rem; /* 1440px */
    margin: 0 auto;
    padding: 0 1rem; /* 1.5rem on desktop */
}
```

### Grid System
**Mobile**: 1 column
**Tablet (md)**: 2 columns
**Desktop (lg)**: 4 columns for products

**Responsive Breakpoints**:
- `md`: 768px
- `lg`: 1024px
- Custom: `37.5em` (600px) for spacing adjustments

## Animations & Transitions

### Standard Transition
```css
--trs: all 0.3s ease-in-out;
```

Applied to:
- Buttons (hover/active states)
- Links (opacity changes)
- Product cards (transform and shadow)
- Navigation links

### Product Card Hover
```css
transform: translateY(-4px);
box-shadow: 0 8px 24px rgba(28, 58, 19, 0.1);
transition: all 0.3s ease-in-out;
```

### Link Opacity
```css
opacity: 0.8; /* hover state */
transition: opacity 0.3s ease-in-out;
```

## Interactive Elements

### Carousel (Testimonials)
**Library**: Swiper.js v11
**Configuration**:
```javascript
{
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
    },
    pagination: {
        clickable: true,
    }
}
```

**Pagination Styling**:
- Bullet color: Asparagus green (#d0d9b9)
- Active bullet: Seed green (#1c3a13)

### Form Inputs
**Newsletter Signup (Body)**:
```css
border: 2px solid #1c3a13;
border-radius: 99em;
padding: 12px 24px;
background: transparent;
```

**Focus State**:
```css
border-color: #334e2b;
outline: none;
```

## Sections & Backgrounds

### Background Variations
| Section Type | Background | Text Color |
|--------------|------------|------------|
| **Hero** | Snowwhite (#fcfcf7) | Seedgreen (#1c3a13) |
| **Products** | Yellowish White (#f6f7ef) | Seedgreen (#1c3a13) |
| **Gut Health** | Seedgreen (#1c3a13) | Snowwhite (#fcfcf7) |
| **ViaCAP** | Snowwhite (#fcfcf7) | Seedgreen (#1c3a13) |
| **Testimonials** | Yellowish White (#f6f7ef) | Seedgreen (#1c3a13) |
| **Newsletter** | Snowwhite (#fcfcf7) | Seedgreen (#1c3a13) |
| **Footer** | Seedgreen (#1c3a13) | Snowwhite (#fcfcf7) |

## Icons & Checkmarks

**Checkmark Icon** (ViaCAP Section):
- SVG with currentColor fill
- Size: 24px × 24px (w-6 h-6)
- Color: Seedgreen (#1c3a13)
- Positioned with `flex-shrink-0` and `mt-1`

## Accessibility Features

### Focus States
- Border color changes on input focus
- No default outline, custom border styling
- Visible hover states on all interactive elements

### Color Contrast
- Seedgreen on Snowwhite: High contrast (AAA)
- Snowwhite on Seedgreen: High contrast (AAA)
- Opacity used for hierarchy, not primary text

### Font Smoothing
```css
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
```

## Image Guidelines

### Product Images
- **Aspect Ratio**: 1:1 (square)
- **Border Radius**: 2rem (32px)
- **Object Fit**: cover
- **Source**: High-quality photography (Unsplash placeholders)

### Hero Images
- **Container**: Fixed height 600px
- **Border Radius**: 2rem (32px)
- **Object Fit**: cover
- **Responsive**: Full width within grid column

### Testimonial Images
- **Aspect Ratio**: 16:9 (video format)
- **Border Radius**: 1rem (16px)
- **Background**: Gray placeholder when no image

## Implementation Notes

### Required Libraries
1. **Tailwind CSS**: Via CDN (`https://cdn.tailwindcss.com`)
2. **Inter Font**: Google Fonts
3. **Swiper.js v11**: Carousel functionality
4. **Lucide Icons**: Icon system (optional)

### CSS Architecture
- **Custom Properties**: All design tokens as CSS variables in `:root`
- **Tailwind Utilities**: Layout and spacing
- **Custom Classes**: Component-specific styling (.btn-primary, .product-card, etc.)
- **Responsive**: Mobile-first approach with `@media` queries

### Performance Optimization
- Font preconnect for Google Fonts
- Lazy loading not implemented (add for production)
- Image optimization recommended (use WebP, srcset)
- Backdrop filter may impact performance on older devices

## Brand Voice in Design

### Visual Characteristics
- **Scientific**: Clean lines, precise spacing, professional imagery
- **Natural**: Organic greens, nature-inspired color palette
- **Premium**: Generous whitespace, high-quality photography, sophisticated typography
- **Approachable**: Rounded corners, friendly spacing, readable text sizes

### Content Tone
- **Educational**: "Whole body health starts in the gut"
- **Credible**: Registered trademark symbols (®, ™)
- **Benefit-focused**: "For digestive and gut health"
- **Transparent**: Scientific terminology without jargon

## Usage Examples

### Creating a New Section
```html
<section class="py-20 px-4">
    <div class="container">
        <h2 class="text-4xl font-bold mb-12 text-center">Section Title</h2>
        <!-- Content -->
    </div>
</section>
```

### Creating a Product Card
```html
<div class="product-card">
    <img src="..." alt="..." class="w-full aspect-square rounded-3xl">
    <h3 class="text-xl font-semibold mt-6 mb-2">Product Name</h3>
    <p class="text-sm opacity-80 mb-4">Product description</p>
    <p class="text-2xl font-bold mb-4">$49.99/month</p>
    <button class="btn-primary w-full">Add to Cart</button>
</div>
```

### Creating a CTA Button Group
```html
<div class="flex flex-wrap gap-4">
    <button class="btn-primary">Primary Action</button>
    <button class="btn-secondary">Secondary Action</button>
</div>
```

## Quality Checklist

- [ ] All colors use CSS custom properties
- [ ] All spacing uses rem units (not px)
- [ ] All interactive elements have hover/active states
- [ ] All transitions are 0.3s ease-in-out
- [ ] All buttons use pill-shaped border radius (99em)
- [ ] All product images are square (1:1 aspect ratio)
- [ ] All section padding is consistent (py-20)
- [ ] All headings use proper hierarchy (H1 → H6)
- [ ] All text has proper color contrast (WCAG AA minimum)
- [ ] All images have descriptive alt text
- [ ] Navigation is sticky with frosted glass effect
- [ ] Footer has 4-column grid on desktop
- [ ] Responsive design works on mobile and desktop

---

**Design System Version**: 2.0
**Last Updated**: 2025-11-03
**Status**: Production Ready
