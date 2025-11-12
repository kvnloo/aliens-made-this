"use client";

import { Creation } from "@/lib/types";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Badge } from "@/components/ui/badge";
import { Calendar, ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";

interface PreviewModalProps {
  creation: Creation | null;
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function PreviewModal({ creation, open, onOpenChange }: PreviewModalProps) {
  if (!creation) return null;

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-6xl h-[90vh] glass border-white/10">
        <DialogHeader>
          <DialogTitle className="text-2xl">{creation.title}</DialogTitle>
          <DialogDescription className="flex items-center gap-4 flex-wrap">
            <span>{creation.description}</span>
            <div className="flex items-center gap-2 text-xs">
              <Calendar className="w-3 h-3" />
              {new Date(creation.createdAt).toLocaleDateString()}
            </div>
          </DialogDescription>
          <div className="flex flex-wrap gap-2 pt-2">
            {creation.tags.map((tag) => (
              <Badge key={tag} variant="glass" className="text-xs">
                {tag}
              </Badge>
            ))}
          </div>
        </DialogHeader>

        <div className="flex-1 relative rounded-lg overflow-hidden border border-white/10 bg-white">
          <iframe
            src={creation.htmlFile}
            className="w-full h-full"
            title={creation.title}
            sandbox="allow-scripts allow-same-origin"
          />
        </div>

        <div className="flex justify-end">
          <a
            href={creation.htmlFile}
            target="_blank"
            rel="noopener noreferrer"
          >
            <Button variant="ghost" size="sm">
              <ExternalLink className="w-4 h-4" />
              Open in New Tab
            </Button>
          </a>
        </div>
      </DialogContent>
    </Dialog>
  );
}
