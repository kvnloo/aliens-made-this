"use client";

import Link from "next/link";
import { Github, Sparkles } from "lucide-react";

export function Navbar() {
  return (
    <nav className="sticky top-0 z-50 glass border-b border-white/10">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <Link href="/" className="flex items-center gap-2 group">
            <Sparkles className="w-6 h-6 text-cyber-purple group-hover:rotate-180 transition-transform duration-500" />
            <span className="text-xl font-bold text-gradient-purple-teal">
              Aliens Made This
            </span>
          </Link>

          <div className="flex items-center gap-6">
            <Link
              href="/"
              className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
            >
              Home
            </Link>
            <Link
              href="/showcase"
              className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
            >
              Showcase
            </Link>
            <a
              href="https://github.com/kvnloo/aliens-made-this"
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-2 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
            >
              <Github className="w-5 h-5" />
              <span className="hidden sm:inline">GitHub</span>
            </a>
          </div>
        </div>
      </div>
    </nav>
  );
}
