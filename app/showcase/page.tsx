"use client";

import { useState } from "react";
import { getCreations } from "@/lib/creations";
import { Creation } from "@/lib/types";
import { CreationCard } from "@/components/CreationCard";
import { PreviewModal } from "@/components/PreviewModal";
import { Sparkles } from "lucide-react";

export default function ShowcasePage() {
  const creations = getCreations();
  const [selectedCreation, setSelectedCreation] = useState<Creation | null>(null);
  const [previewOpen, setPreviewOpen] = useState(false);

  const handlePreview = (creation: Creation) => {
    setSelectedCreation(creation);
    setPreviewOpen(true);
  };

  return (
    <div className="min-h-screen">
      <section className="container mx-auto px-4 sm:px-6 lg:px-8 py-12 md:py-20">
        <div className="space-y-8">
          {/* Header */}
          <div className="text-center space-y-4">
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass border border-white/10">
              <Sparkles className="w-4 h-4 text-cyber-purple" />
              <span className="text-sm text-muted-foreground">
                {creations.length} AI-Generated Creations
              </span>
            </div>

            <h1 className="text-4xl md:text-6xl font-bold tracking-tight">
              <span className="text-gradient-purple-teal">Showcase</span>
            </h1>

            <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
              Browse through our collection of AI-generated web designs. Click on
              any creation to view a live preview.
            </p>
          </div>

          {/* Gallery Grid */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 pt-8">
            {creations.map((creation) => (
              <CreationCard
                key={creation.id}
                creation={creation}
                onPreview={handlePreview}
              />
            ))}
          </div>

          {/* Empty State */}
          {creations.length === 0 && (
            <div className="text-center py-20">
              <p className="text-muted-foreground">
                No creations yet. Check back soon!
              </p>
            </div>
          )}
        </div>
      </section>

      {/* Preview Modal */}
      <PreviewModal
        creation={selectedCreation}
        open={previewOpen}
        onOpenChange={setPreviewOpen}
      />
    </div>
  );
}
