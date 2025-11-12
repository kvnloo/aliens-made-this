"use client";

import { Creation } from "@/lib/types";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Eye, Calendar } from "lucide-react";

interface CreationCardProps {
  creation: Creation;
  onPreview: (creation: Creation) => void;
}

export function CreationCard({ creation, onPreview }: CreationCardProps) {
  return (
    <Card className="glass border-white/10 hover:border-cyber-purple/50 transition-all duration-300 group overflow-hidden">
      <div className="aspect-video bg-gradient-to-br from-cyber-purple/20 via-electric-teal/20 to-mystic-pink/20 flex items-center justify-center relative overflow-hidden">
        <div className="absolute inset-0 bg-gradient-cosmic opacity-20 animate-gradient"></div>
        <div className="relative z-10 text-6xl font-bold text-white/20 group-hover:scale-110 transition-transform">
          AI
        </div>
      </div>

      <CardHeader>
        <CardTitle className="group-hover:text-gradient-purple-teal transition-all">
          {creation.title}
        </CardTitle>
        <CardDescription>{creation.description}</CardDescription>
      </CardHeader>

      <CardContent>
        <div className="flex flex-wrap gap-2">
          {creation.tags.map((tag) => (
            <Badge key={tag} variant="glass" className="text-xs">
              {tag}
            </Badge>
          ))}
        </div>
      </CardContent>

      <CardFooter className="flex justify-between items-center">
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <Calendar className="w-4 h-4" />
          <span>{new Date(creation.createdAt).toLocaleDateString()}</span>
        </div>

        <Button
          variant="gradient"
          size="sm"
          onClick={() => onPreview(creation)}
          className="group/btn"
        >
          <Eye className="w-4 h-4" />
          Preview
        </Button>
      </CardFooter>
    </Card>
  );
}
