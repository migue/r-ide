### Name: xy.coords
### Title: Extracting Plotting Structures
### Aliases: xy.coords
### Keywords: dplot

### ** Examples

xy.coords(stats::fft(c(1:10)), NULL)

with(cars, xy.coords(dist ~ speed, NULL)$xlab ) # = "speed"

xy.coords(1:3, 1:2, recycle=TRUE)
xy.coords(-2:10,NULL, log="y")
##> warning: 3 y values <=0 omitted ..



