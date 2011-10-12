### Name: is
### Title: Is an Object from a Class
### Aliases: is extends setIs
### Keywords: programming classes methods

### ** Examples

## Don't show: 
## A simple class with two slots
setClass("track",
         representation(x="numeric", y="numeric"))
## A class extending the previous, adding one more slot
## End Don't show
## Two examples of setIs() with coerce= and replace= arguments
## The first one works fairly well, because neither class has many
## inherited methods do be disturbed by the new inheritance

## The second example does NOT work well, because the new superclass,
## "factor", causes methods to be inherited that should not be.

## First example:
## a class definition (see setClass for class "track")
setClass("trackCurve", contains = "track",
         representation( smooth = "numeric"))
## A class similar to "trackCurve", but with different structure
## allowing matrices for the "y" and "smooth" slots
setClass("trackMultiCurve",
         representation(x="numeric", y="matrix", smooth="matrix"),
         prototype = structure(list(), x=numeric(), y=matrix(0,0,0),

                               smooth= matrix(0,0,0)))
## Automatically convert an object from class "trackCurve" into
## "trackMultiCurve", by making the y, smooth slots into 1-column matrices
setIs("trackCurve",
      "trackMultiCurve",
      coerce = function(obj) {
        new("trackMultiCurve",
            x = obj@x,
            y = as.matrix(obj@y),
            smooth = as.matrix(obj@smooth))
      },
      replace = function(obj, value) {
        obj@y <- as.matrix(value@y)
        obj@x <- value@x
        obj@smooth <- as.matrix(value@smooth)
        obj})

## Don't show: 
removeClass("trackMultiCurve")
removeClass("trackCurve")
removeClass("track")
## End Don't show

## Second Example:
## A class that adds a slot to "character"
setClass("stringsDated", contains = "character", representation(stamp="POSIXt"))

## Convert automatically to a factor by explicit coerce 
setIs("stringsDated", "factor",
   coerce = function(from){factor(from@.Data)}, 
   replace=function(from, value){
       from@.Data<- as.character(value); from})

## Don't show: 

set.seed(750)
## End Don't show
ll <- sample(letters, 10, replace = TRUE)
 ld <- new("stringsDated", ll, stamp = Sys.time())

levels(as(ld, "factor"))

levels(ld) # will be NULL--see comment in section on inheritance above.

## In contrast, a class that simply extends "factor" has no such ambiguities

setClass("factorDated", contains = "factor", representation(stamp="POSIXt"))

fd = new("factorDated", factor(ll), stamp = Sys.time())

identical(levels(fd), levels(as(fd, "factor")))





