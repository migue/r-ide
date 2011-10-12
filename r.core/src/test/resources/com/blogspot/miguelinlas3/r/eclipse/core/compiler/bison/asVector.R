### Name: asVector
### Title: Coerce an Object to a Vector
### Aliases: asVector
### Keywords: models

### ** Examples

require(stats)
ispl <- interpSpline( weight ~ height,  women )
pred <- predict(ispl)
class(pred)
utils::str(pred)
asVector(pred)



