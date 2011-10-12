### Name: grid.frame
### Title: Create a Frame for Packing Objects
### Aliases: grid.frame frameGrob
### Keywords: dplot

### ** Examples

grid.newpage()
grid.frame(name="gf", draw=TRUE)
grid.pack("gf", rectGrob(gp=gpar(fill="grey")), width=unit(1, "null"))
grid.pack("gf", textGrob("hi there"), side="right")



