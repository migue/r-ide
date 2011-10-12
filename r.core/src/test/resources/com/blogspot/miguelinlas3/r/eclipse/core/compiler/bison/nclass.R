### Encoding: latin1

### Name: nclass
### Title: Compute the Number of Classes for a Histogram
### Aliases: nclass.Sturges nclass.scott nclass.FD
### Keywords: univar

### ** Examples

set.seed(1)
x <- stats::rnorm(1111)
nclass.Sturges(x)

## Compare them:
NC <- function(x) c(Sturges = nclass.Sturges(x),
      Scott = nclass.scott(x), FD = nclass.FD(x))
NC(x)
onePt <- rep(1, 11)
NC(onePt) # no longer gives NaN



