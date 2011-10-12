### Name: show
### Title: Show an Object
### Aliases: show show-methods show,ANY-method show,traceable-method
###   show,ObjectsWithPackage-method show,MethodDefinition-method
###   show,MethodWithNext-method show,genericFunction-method
###   show,classRepresentation-method
### Keywords: programming

### ** Examples

## following the example shown in the setMethod documentation ...
setClass("track",
         representation(x="numeric", y="numeric"))
setClass("trackCurve", 
         representation("track", smooth = "numeric"))

t1 <- new("track", x=1:20, y=(1:20)^2)

tc1 <- new("trackCurve", t1)

setMethod("show", "track",
  function(object)print(rbind(x = object@x, y=object@y))
)
## The method will now be used for automatic printing of t1

t1

## Not run: 
##D   [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
##D x    1    2    3    4    5    6    7    8    9    10    11    12
##D y    1    4    9   16   25   36   49   64   81   100   121   144
##D   [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20]
##D x    13    14    15    16    17    18    19    20
##D y   169   196   225   256   289   324   361   400
## End(Not run)
## and also for tc1, an object of a class that extends "track"
tc1

## Not run: 
##D   [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
##D x    1    2    3    4    5    6    7    8    9    10    11    12
##D y    1    4    9   16   25   36   49   64   81   100   121   144
##D   [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20]
##D x    13    14    15    16    17    18    19    20
##D y   169   196   225   256   289   324   361   400
## End(Not run)



