### Name: setClass
### Title: Create a Class Definition
### Aliases: setClass
### Keywords: programming classes methods

### ** Examples

## Don't show: 
 if(isClass("trackMultiCurve")) removeClass("trackMultiCurve")
 if(isClass("trackCurve"))      removeClass("trackCurve")
 if(isClass("track"))           removeClass("track")
## End Don't show
## A simple class with two slots
setClass("track",
         representation(x="numeric", y="numeric"))
## A class extending the previous, adding one more slot
setClass("trackCurve",
    representation(smooth = "numeric"),
    contains = "track")
## A class similar to "trackCurve", but with different structure
## allowing matrices for the "y" and "smooth" slots
setClass("trackMultiCurve",
         representation(x="numeric", y="matrix", smooth="matrix"),
         prototype = list(x=numeric(), y=matrix(0,0,0),
                          smooth= matrix(0,0,0)))
##
## Suppose we want trackMultiCurve to be like trackCurve when there's
## only one column.
## First, the wrong way.
try(setIs("trackMultiCurve", "trackCurve",
    test = function(obj) {ncol(slot(obj, "y")) == 1}))

## Why didn't that work?  You can only override the slots "x", "y",
## and "smooth" if you provide an explicit coerce function to correct
## any inconsistencies:

setIs("trackMultiCurve", "trackCurve",
  test = function(obj) {ncol(slot(obj, "y")) == 1},
  coerce = function(obj) {
     new("trackCurve",
         x = slot(obj, "x"),
         y = as.numeric(slot(obj,"y")),
         smooth = as.numeric(slot(obj, "smooth")))
  })

## A class that extends the built-in data type "numeric"

setClass("numWithId", representation(id = "character"),
         contains = "numeric")

new("numWithId", 1:3, id = "An Example")

## Don't show: 
tMC <- new("trackMultiCurve")
is.matrix(slot(tMC, "y"))
is.matrix(slot(tMC, "smooth"))
setClass("myMatrix", "matrix", prototype = matrix(0,0,0))
nrow(new("myMatrix")) # 0
nrow(new("matrix")) # 1
## simple test of prototype data
xxx <- stats::rnorm(3)
setClass("xNum", representation(x = "numeric"), prototype = list(x = xxx))
stopifnot(identical(new("xNum")@x, xxx))
### tests of the C macros MAKE_CLASS and NEW
### FIXME:  there should be a separate man page for the C-level macros
### and the tests below should be there.
stopifnot(identical(.Call("R_methods_test_MAKE_CLASS", "trackCurve",
                          PACKAGE = "methods"),
                    getClass("trackCurve")))

stopifnot(identical(.Call("R_methods_test_NEW", "track", PACKAGE = "methods"),
                    new("track")))

## The following should not be needed.  But make check removes all files
## between example files, in a crude way that does not cause the class
## information to be reset.  There seems no way to detect this, so we
## have to remove classes ourselves

removeClass("withId")
removeClass("maybeNumber")
removeClass("xNum")
removeClass("myMatrix")
resetClass("integer")
resetClass("numeric")
resetClass("logical")
removeClass("trackMultiCurve")
removeClass("trackCurve")
removeClass("track")
## End Don't show



