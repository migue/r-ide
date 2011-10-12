### Name: islands
### Title: Areas of the World's Major Landmasses
### Aliases: islands
### Keywords: datasets

### ** Examples

require(graphics)
dotchart(log(islands, 10),
   main = "islands data: log10(area) (log10(sq. miles))")
dotchart(log(islands[order(islands)], 10),
   main = "islands data: log10(area) (log10(sq. miles))")



