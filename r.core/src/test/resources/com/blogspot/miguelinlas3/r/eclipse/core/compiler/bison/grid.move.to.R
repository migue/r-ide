### Name: grid.move.to
### Title: Move or Draw to a Specified Position
### Aliases: grid.move.to grid.line.to moveToGrob lineToGrob
### Keywords: dplot

### ** Examples

grid.newpage()
grid.move.to(0.5, 0.5)
grid.line.to(1, 1)
grid.line.to(0.5, 0)
pushViewport(viewport(x=0, y=0, w=0.25, h=0.25, just=c("left", "bottom")))
grid.rect()
grid.grill()
grid.line.to(0.5, 0.5)
popViewport()



