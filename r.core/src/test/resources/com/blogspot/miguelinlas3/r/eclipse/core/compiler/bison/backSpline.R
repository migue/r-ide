### Name: backSpline
### Title: Monotone Inverse Spline
### Aliases: backSpline
### Keywords: models

### ** Examples

require(graphics)
ispl <- interpSpline( women$height, women$weight )
bspl <- backSpline( ispl )
plot( bspl )                   # plots over the range of the knots
points( women$weight, women$height )



