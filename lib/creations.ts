import { Creation } from "./types";

// This would typically be loaded from a JSON file or database
// For now, we'll use static data
export const creations: Creation[] = [
  {
    id: "demo-001",
    title: "Glassmorphism Landing Page",
    description: "A modern landing page featuring glassmorphism design with vibrant gradients and smooth animations.",
    htmlFile: "/aliens-made-this/creations/demo-001.html",
    createdAt: "2025-11-12",
    tags: ["landing-page", "glassmorphism", "gradient"],
  },
  {
    id: "demo-002",
    title: "3D Card Showcase",
    description: "Interactive 3D cards with hover effects and beautiful color schemes inspired by nature.",
    htmlFile: "/aliens-made-this/creations/demo-002.html",
    createdAt: "2025-11-11",
    tags: ["cards", "3d", "interactive"],
  },
  {
    id: "demo-003",
    title: "Cosmic Dashboard",
    description: "A futuristic dashboard with cosmic-themed gradients and sleek data visualizations.",
    htmlFile: "/aliens-made-this/creations/demo-003.html",
    createdAt: "2025-11-10",
    tags: ["dashboard", "data-viz", "cosmic"],
  },
];

export function getCreations(): Creation[] {
  return creations;
}

export function getCreationById(id: string): Creation | undefined {
  return creations.find((creation) => creation.id === id);
}
