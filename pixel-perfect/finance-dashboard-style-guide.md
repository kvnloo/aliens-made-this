# Finance/Travel Dashboard - Style Guide

## Design Analysis
This is a mobile travel booking interface with tropical/vacation theme.

### Color Palette
- **Primary Background**: Soft cyan/turquoise (#7dd3c0, #88d4c0)
- **Card Backgrounds**:
  - Dark teal/navy: #1a3a4a, #2d4e5e
  - Light cyan overlay: rgba(125, 211, 192, 0.9)
- **Accent Colors**:
  - Warm orange: #f4a261, #e76f51
  - Cyan: #7dd3c0
  - Navy: #264653
- **Text Colors**:
  - Light card text: #ffffff
  - Dark card text: #1a3a4a
  - Muted: rgba(255, 255, 255, 0.7)

### Typography
- **Primary Font**: 'Poppins', sans-serif (clean, modern)
- **Headings**: 600-700 weight
- **Body**: 400-500 weight
- **Display numbers**: 700 weight, large size
- **Small labels**: 400 weight, uppercase, 0.7rem

### Card Components

1. **Left Card** (Vintage bus scene)
   - Full-height background image
   - Gradient overlay at bottom
   - Bottom info bar with icons
   - Rounded corners

2. **Right Card** (Travel booking)
   - Header with location name
   - Large hero image (mountain/ocean)
   - Decorative elements (planes)
   - Price comparison section
   - Passenger icons
   - Slider control
   - Action buttons

### Layout
- **Mobile-first**: Vertical card layout
- **Card width**: Max 400px
- **Card height**: ~700-800px
- **Border radius**: 2rem (32px) for cards
- **Gap**: 2rem between cards

### Spacing
- Card padding: 1.5rem
- Section gaps: 1.5rem
- Small gaps: 0.75rem
- Icon spacing: 0.5rem

### Buttons
- **Primary**: Warm orange (#f4a261), rounded-full
- **Secondary**: Transparent with border
- **Icon buttons**: Circular, small
- **Padding**: 0.75rem 1.5rem
- **Border radius**: 2rem (pill shape)

### Icons
- Person icons for passenger count
- Plane icons for decoration
- Menu/navigation icons
- Small decorative elements

### Image Treatment
- **Background images**: Full cover, center positioned
- **Overlay gradients**:
  - Bottom: linear-gradient(to top, rgba(0,0,0,0.5), transparent)
  - Overall: rgba(125, 211, 192, 0.1)
- **Filter**: Slight saturation increase

### Price Display
- **Large numbers**: 3rem font size, bold
- **Currency symbol**: 1.5rem, lighter weight
- **Comparison layout**: Side-by-side with divider
- **Labels**: Small, uppercase, muted

### Special Elements
- **Slider**: Custom range input with cyan track
- **Passenger counter**: Small person icons in row
- **Rating stars**: Small, filled/unfilled
- **Decorative planes**: Silhouettes positioned absolutely

### Effects
- **Card shadow**: 0 20px 60px rgba(0, 0, 0, 0.15)
- **Hover effects**: Slight scale and shadow increase
- **Image parallax**: Subtle on scroll (optional)
- **Smooth transitions**: 300ms ease for all interactions
