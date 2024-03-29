### Name: polySpline
### Title: Piecewise Polynomial Spline Representation
### Aliases: polySpline as.polySpline
### Keywords: models

### ** Examples

require(graphics)
ispl <- polySpline( interpSpline( weight ~ height,  women, bSpline = TRUE ) )
print( ispl )   # print the piecewise polynomial representation
plot( ispl )    # plots over the range of the knots
points( women$height, women$weight )



