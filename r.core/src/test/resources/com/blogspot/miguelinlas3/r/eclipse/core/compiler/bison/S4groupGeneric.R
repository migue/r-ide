### Name: S4groupGeneric
### Title: Group Generic Functions
### Aliases: S4groupGeneric GroupGenericFunctions Math Ops Summary Arith
###   Logic Compare Complex Math2
### Keywords: methods

### ** Examples

setClass("testComplex", representation(zz = "complex"))
## method for whole group "Complex"
setMethod("Complex", "testComplex",
          function(z) c("groupMethod", callGeneric(z@zz)))
## exception for Arg() :
setMethod("Arg", "testComplex",
          function(z) c("ArgMethod", Arg(z@zz)))
z1 <- 1+2i
z2 <- new("testComplex", zz = z1)
stopifnot(identical(Mod(z2), c("groupMethod", Mod(z1))))
stopifnot(identical(Arg(z2), c("ArgMethod", Arg(z1))))
## Don't show: 
removeMethods("Complex")
removeMethods("Arg")
## End Don't show


