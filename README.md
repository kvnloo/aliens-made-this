# Aliens Made This 👽✨

A stunning showcase website for AI-generated web designs, built with Next.js and shadcn/ui.

[![Deploy to GitHub Pages](https://github.com/kvnloo/aliens-made-this/actions/workflows/deploy.yml/badge.svg)](https://github.com/kvnloo/aliens-made-this/actions/workflows/deploy.yml)

## 🌐 Live Website

Visit the live showcase at: **[https://kvnloo.github.io/aliens-made-this](https://kvnloo.github.io/aliens-made-this)**

## ✨ Features

- **🎨 Modern Design System**: Black background with vibrant gradients (Cyber Purple, Electric Teal, Sunset Orange, Mystic Pink)
- **🔮 Glassmorphism Effects**: Beautiful frosted glass UI components with backdrop blur
- **📱 Fully Responsive**: Seamless experience across mobile, tablet, and desktop
- **⚡ Live HTML Previews**: Interactive iframe-based preview system for all creations
- **🚀 Fast Performance**: Static site generation with Next.js 14 for optimal speed
- **🎯 Accessible**: Built with accessibility in mind using shadcn/ui components
- **🤖 AI-Generated Content**: Showcase for AI-created web designs

## 🛠️ Tech Stack

- **Framework**: [Next.js 14](https://nextjs.org/) (App Router)
- **UI Components**: [shadcn/ui](https://ui.shadcn.com/) + [Radix UI](https://www.radix-ui.com/)
- **Styling**: [Tailwind CSS 4](https://tailwindcss.com/)
- **Language**: [TypeScript](https://www.typescriptlang.org/)
- **Deployment**: [GitHub Pages](https://pages.github.com/)
- **CI/CD**: GitHub Actions

## 🎨 Color Palette

```css
/* Primary Background */
--background: #000000 (Pure Black)

/* Accent Colors */
--cyber-purple: #A855F7
--electric-teal: #06B6D4
--sunset-orange: #FB923C
--mystic-pink: #EC4899

/* Gradients */
--gradient-purple-teal: linear-gradient(135deg, #A855F7, #06B6D4)
--gradient-orange-pink: linear-gradient(135deg, #FB923C, #EC4899)
--gradient-cosmic: linear-gradient(135deg, #A855F7, #EC4899, #FB923C, #06B6D4)
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+ and npm

### Installation

```bash
# Clone the repository
git clone https://github.com/kvnloo/aliens-made-this.git
cd aliens-made-this

# Install dependencies
npm install

# Run development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the site.

### Build for Production

```bash
# Create optimized static export
npm run build

# The static files will be in the 'out' directory
```

## 📁 Project Structure

```
aliens-made-this/
├── app/                    # Next.js app directory
│   ├── layout.tsx         # Root layout with navigation
│   ├── page.tsx           # Landing page
│   ├── showcase/          # Showcase gallery page
│   └── globals.css        # Global styles & design system
├── components/            # React components
│   ├── ui/               # shadcn/ui components
│   ├── Navbar.tsx        # Navigation bar
│   ├── Footer.tsx        # Footer
│   ├── CreationCard.tsx  # Card for each creation
│   └── PreviewModal.tsx  # Modal for live previews
├── lib/                   # Utility functions
│   ├── utils.ts          # Helper functions
│   ├── types.ts          # TypeScript types
│   └── creations.ts      # Creation data
├── public/               # Static assets
│   └── creations/        # HTML files for showcased creations
└── .github/workflows/    # GitHub Actions for deployment
```

## 📝 Adding New Creations

1. **Add HTML file**: Place your HTML file in `/public/creations/`
   ```bash
   # Example: /public/creations/my-design.html
   ```

2. **Update creations data**: Edit `/lib/creations.ts`
   ```typescript
   {
     id: "my-design",
     title: "My Amazing Design",
     description: "A beautiful AI-generated landing page",
     htmlFile: "/aliens-made-this/creations/my-design.html",
     createdAt: "2025-11-12",
     tags: ["landing-page", "modern", "gradient"]
   }
   ```

3. **Commit and push**: Changes will auto-deploy via GitHub Actions
   ```bash
   git add .
   git commit -m "Add new design: My Amazing Design"
   git push
   ```

## 🌐 Deployment

The site automatically deploys to GitHub Pages when you push to the main branch:

1. GitHub Actions workflow builds the Next.js site
2. Static files are generated in the `out` directory
3. Site is deployed to `https://kvnloo.github.io/aliens-made-this`

### Manual Deployment

```bash
npm run build
# Upload the 'out' directory to your hosting provider
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 👽 About

This project showcases the capabilities of AI in web development. Each design demonstrates modern UI/UX patterns including glassmorphism, gradient art, and interactive animations.

---

Made with 💜 by AI
