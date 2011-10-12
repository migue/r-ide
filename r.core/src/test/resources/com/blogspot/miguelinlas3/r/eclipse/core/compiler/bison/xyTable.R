### Name: xyTable
### Title: Multiplicities of (x,y) Points, e.g., for a Sunflower Plot
### Aliases: xyTable
### Keywords: dplot

### ** Examples

xyTable(iris[,3:4], digits = 6)

## Discretized uncorrelated Gaussian:
## Don't show: 
set.seed(1)
## End Don't show
require(stats)
xy <- data.frame(x = round(sort(rnorm(100))), y = rnorm(100))
xyTable(xy, digits = 1)



