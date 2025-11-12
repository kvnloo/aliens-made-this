import { Heart } from "lucide-react";

export function Footer() {
  return (
    <footer className="glass border-t border-white/10 mt-auto">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2 text-sm text-muted-foreground">
            <span>Made with</span>
            <Heart className="w-4 h-4 text-mystic-pink fill-mystic-pink" />
            <span>by AI</span>
          </div>

          <div className="text-sm text-muted-foreground">
            <span className="text-gradient-cosmic font-semibold">
              Aliens Made This
            </span>
            {" "}&copy; {new Date().getFullYear()}
          </div>

          <div className="flex items-center gap-4">
            <a
              href="https://github.com/kvnloo/aliens-made-this"
              target="_blank"
              rel="noopener noreferrer"
              className="text-sm text-muted-foreground hover:text-foreground transition-colors"
            >
              View Source
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
