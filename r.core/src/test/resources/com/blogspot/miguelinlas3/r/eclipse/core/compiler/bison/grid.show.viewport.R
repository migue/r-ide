### Name: grid.show.viewport
### Title: Draw a Diagram of a Grid Viewport
### Aliases: grid.show.viewport
### Keywords: dplot

### ** Examples

## Diagram of a sample viewport
grid.show.viewport(viewport(x=0.6, y=0.6,
                            w=unit(1, "inches"), h=unit(1, "inches")))
grid.show.viewport(viewport(layout.pos.row=2, layout.pos.col=2:3),
                   grid.layout(3, 4))



