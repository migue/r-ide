### Name: grid.get
### Title: Get a Grid Graphical Object
### Aliases: grid.get grid.gget getGrob
### Keywords: dplot

### ** Examples

grid.xaxis(name="xa")
grid.get("xa")
grid.get(gPath("xa", "ticks"))

grid.draw(gTree(name="gt", children=gList(xaxisGrob(name="axis"))))
grid.get(gPath("gt", "axis", "ticks"))



