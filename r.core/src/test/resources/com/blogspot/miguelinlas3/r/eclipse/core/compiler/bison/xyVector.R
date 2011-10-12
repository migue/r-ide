### Name: xyVector
### Title: Construct an xyVector Object
### Aliases: xyVector
### Keywords: models

### ** Examples

require(stats); require(graphics)
ispl <- interpSpline( weight ~ height, women )
weights <- predict( ispl, seq( 55, 75, length.out = 51 ))
class( weights )
plot( weights, type = "l", xlab = "height", ylab = "weight" )
points( women$height, women$weight )
weights



