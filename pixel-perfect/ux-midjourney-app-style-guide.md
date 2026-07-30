# UX Midjourney App - Style Guide

## Design Analysis
A food app UI showcasing pizza with two distinct screens: a dark detailed product view and a light catalog/menu view. 3D rendered food imagery with clean, modern interface design.

## Color Palette
### Dark Screen (PEZZ2D)
```css
--bg-dark: #4a4a5e
--bg-light-section: #f5e6d3
--text-dark: #2c2c3e
--text-light: #ffffff
--accent-red: #ff4757
--accent-orange: #ff6348
--tomato-red: #e84118
--cheese-yellow: #ffd93d
--basil-green: #6ab04c
```

### Light Screen (PLICATE)
```css
--bg-cream: #f5e6d3
--bg-white: #ffffff
--text-dark: #2c2c3e
--text-gray: #7f8c8d
--accent-orange: #ff9f43
--accent-red: #ff6b6b
--accent-green: #6ab04c
--border-light: #e8d5c4
```

## Typography
- **Heading Font**: 'Space Grotesk', sans-serif (Bold, uppercase)
- **Body Font**: 'Inter', sans-serif
- **Display Font**: Custom stylized font for "PEZZ2D"

### Font Sizes
- App Name: 48px / 3rem (Display)
- Section Title: 28px / 1.75rem
- Product Name: 20px / 1.25rem
- Body: 16px / 1rem
- Caption: 14px / 0.875rem
- Small: 12px / 0.75rem

## Layout Structure
### Mobile Format (9:16 aspect ratio)
- Screen width: 375px standard
- Padding: 24px sides, 32px top/bottom
- Border radius: 32px outer corners (device frame)
- Card radius: 16px for content cards

## 3D Food Rendering Style
### Pizza Characteristics
- Photorealistic 3D rendering
- Top-down and angled views
- Visible texture detail (cheese, toppings)
- Soft shadows for depth
- Warm lighting for appetizing look

### Ingredient Colors
- Cheese: Warm yellow (#ffd93d)
- Tomato sauce: Rich red (#e84118)
- Pepperoni: Dark red circles
- Basil: Fresh green
- Dough: Golden brown edges

## Components

### Dark Screen (Product Detail)
**Header**
- App logo (top left)
- "PEFFIOR" text
- Menu icon (top right)

**Hero Section**
- Large pizza image (centered)
- Decorative tomato icons (corners)
- Product name "PEZZ2D" (large, stylized)
- Subtitle text
- Utensil icons (fork, knife)

**Bottom Section**
- Cream background
- Nutrition/ingredient tabs
- Quantity selector
- Price display
- "Add" button (orange)

### Light Screen (Catalog View)
**Header**
- Star icon + "PLICATE" branding
- Navigation icons

**Content Grid**
- 2-column layout
- Pizza variation cards
- Ingredient tags with icons
- Labels: "2D" indicator

**Card Structure**
- Pizza image (3D rendered)
- Product name below
- Icon + label (ingredients)
- Clean spacing

## Visual Effects
- Soft drop shadows: 0 8px 24px rgba(0, 0, 0, 0.12)
- Card elevation on hover
- Smooth transitions: 0.25s ease
- Border radius consistency: 16px

## Buttons & Tags
**Primary Button**
- Background: Orange gradient
- Border radius: 12px
- Padding: 14px 24px
- Font weight: 600

**Tags**
- Rounded pill shape (24px radius)
- White background with border
- Icon + text combination
- Padding: 8px 16px

## Icons
- Simple line icons
- Consistent weight (2px stroke)
- Rounded ends
- Monochrome or accent colors

## Accessibility
- High contrast text
- Touch targets: min 44x44px
- Clear visual hierarchy
- Descriptive labels for food items
