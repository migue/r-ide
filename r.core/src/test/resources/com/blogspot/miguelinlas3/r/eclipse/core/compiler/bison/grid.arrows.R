### Name: grid.arrows
### Title: Draw Arrows
### Aliases: grid.arrows arrowsGrob
### Keywords: dplot

### ** Examples

## Not run: 
##D ## to avoid lots of deprecation warnings
##D pushViewport(viewport(layout=grid.layout(2, 4)))
##D pushViewport(viewport(layout.pos.col=1,
##D                        layout.pos.row=1))
##D grid.rect(gp=gpar(col="grey"))
##D grid.arrows()
##D popViewport()
##D pushViewport(viewport(layout.pos.col=2,
##D                        layout.pos.row=1))
##D grid.rect(gp=gpar(col="grey"))
##D grid.arrows(angle=15, type="closed")
##D popViewport()
##D pushViewport(viewport(layout.pos.col=3,
##D                        layout.pos.row=1))
##D grid.rect(gp=gpar(col="grey"))
##D grid.arrows(angle=5, length=unit(0.1, "npc"),
##D             type="closed", gp=gpar(fill="white"))
##D popViewport()
##D pushViewport(viewport(layout.pos.col=4,
##D                        layout.pos.row=1))
##D grid.rect(gp=gpar(col="grey"))
##D grid.arrows(x=unit(0:80/100, "npc"),
##D             y=unit(1 - (0:80/100)^2, "npc"))
##D popViewport()
##D pushViewport(viewport(layout.pos.col=1,
##D                        layout.pos.row=2))
##D grid.rect(gp=gpar(col="grey"))
##D grid.arrows(ends="both")
##D popViewport()
##D pushViewport(viewport(layout.pos.col=2,
##D                        layout.pos.row=2))
##D grid.rect(gp=gpar(col="grey"))
##D # Recycling arguments
##D grid.arrows(x=unit(1:10/11, "npc"), y=unit(1:3/4, "npc"))
##D popViewport()
##D pushViewport(viewport(layout.pos.col=3,
##D                        layout.pos.row=2))
##D grid.rect(gp=gpar(col="grey"))
##D # Drawing arrows on a segments grob
##D gs <- segmentsGrob(x0=unit(1:4/5, "npc"),
##D                    x1=unit(1:4/5, "npc"))
##D grid.arrows(grob=gs, length=unit(0.1, "npc"),
##D             type="closed", gp=gpar(fill="white"))
##D popViewport()
##D pushViewport(viewport(layout.pos.col=4,
##D                        layout.pos.row=2))
##D grid.rect(gp=gpar(col="grey"))
##D # Arrows on a lines grob
##D # Name these because going to grid.edit them later
##D gl <- linesGrob(name="curve", x=unit(0:80/100, "npc"),
##D                 y=unit((0:80/100)^2, "npc"))
##D grid.arrows(name="arrowOnLine", grob=gl, angle=15, type="closed",
##D             gp=gpar(fill="black"))
##D popViewport()
##D pushViewport(viewport(layout.pos.col=1,
##D                        layout.pos.row=2))
##D grid.move.to(x=0.5, y=0.8)
##D popViewport()
##D pushViewport(viewport(layout.pos.col=4,
##D                        layout.pos.row=1))
##D # Arrows on a line.to grob
##D glt <- lineToGrob(x=0.5, y=0.2, gp=gpar(lwd=3))
##D grid.arrows(grob=glt, ends="first", gp=gpar(lwd=3))
##D popViewport(2)
##D grid.edit(gPath("arrowOnLine", "curve"), y=unit((0:80/100)^3, "npc"))
## End(Not run)



