### Name: setMethod
### Title: Create and Save a Method
### Aliases: setMethod removeMethod
### Keywords: programming classes methods

### ** Examples

## Don't show: 
  require(stats)
  setClass("track",
    representation(x="numeric", y = "numeric"))
  setClass("trackCurve", representation("track",
    smooth = "numeric"))
  setClass("trackMultiCurve", representation(x="numeric", y="matrix", smooth="matrix"),
          prototype = list(x=numeric(), y=matrix(0,0,0), smooth=
  matrix(0,0,0)))
## End Don't show

require(graphics)
## methods for plotting track objects (see the example for setClass)
##
## First, with only one object as argument:
setMethod("plot", signature(x="track", y="missing"),
  function(x,  y, ...) plot(slot(x, "x"), slot(x, "y"), ...)
)
## Second, plot the data from the track on the y-axis against anything
## as the x data.
setMethod("plot", signature(y = "track"),
 function(x, y, ...) plot(x, slot(y, "y"), ...)
)
## and similarly with the track on the x-axis (using the short form of
## specification for signatures)
setMethod("plot", "track",
 function(x, y, ...) plot(slot(x, "y"), y,  ...)
)
t1 <- new("track", x=1:20, y=(1:20)^2)
tc1 <- new("trackCurve", t1)
slot(tc1, "smooth") <- smooth.spline(slot(tc1, "x"), slot(tc1, "y"))$y #$
plot(t1)
plot(qnorm(ppoints(20)), t1)
## An example of inherited methods, and of conforming method arguments
## (note the dotCurve argument in the method, which will be pulled out
## of ... in the generic.
setMethod("plot", c("trackCurve", "missing"),
function(x, y, dotCurve = FALSE, ...) {
  plot(as(x, "track"))
  if(length(slot(x, "smooth") > 0))
    lines(slot(x, "x"), slot(x, "smooth"),
         lty = if(dotCurve) 2 else 1)
  }
)
## the plot of tc1 alone has an added curve; other uses of tc1
## are treated as if it were a "track" object.
plot(tc1, dotCurve = TRUE)
plot(qnorm(ppoints(20)), tc1)

## defining methods for a special function.
## Although "[" and "length" are not ordinary functions
## methods can be defined for them.
setMethod("[", "track",
  function(x, i, j, ..., drop) {
    x@x <- x@x[i]; x@y <- x@y[i]
    x
  })
plot(t1[1:15])

setMethod("length", "track", function(x)length(x@y))
length(t1)

## methods can be defined for missing arguments as well
setGeneric("summary") ## make the function into a generic

## A method for summary()
## The method definition can include the arguments, but
## if they're omitted, class "missing" is assumed.

setMethod("summary", "missing", function() "<No Object>")

## Don't show: 

stopifnot(identical(summary(), "<No Object>"))

removeMethods("summary")

## for the primitives
## inherited methods

length(tc1)
tc1[-1]

## make sure old-style methods still work.
t11 <- t1[1:15]
identical(t1@y[1:15], t11@y)

## S3 methods, with nextMethod
form <- y ~ x
form[1]

## S3 arithmetic methods
ISOdate(1990, 12, 1)- ISOdate(1980, 12, 1)

## group methods

setMethod("Arith", c("track", "numeric"), function(e1, e2){e1@y <-
  callGeneric(e1@y , e2); e1})

t1  - 100.

t1/2

## check it hasn't screwed up S3 methods
ISOdate(1990, 12, 1)- ISOdate(1980, 12, 1)

## test the .Generic mechanism

setMethod("Compare", signature("track", "track"),
  function(e1,e2) {
  switch(.Generic,
   "==" = e1@y == e2@y,
  NA)
 })

#stopifnot(all(t1==t1))
#stopifnot(identical(t1<t1, NA))

## A test of nested calls to "[" with matrix-style arguments
## applied to data.frames (S3 methods)

setMethod("[", c("trackMultiCurve", "numeric", "numeric"), function(x, i, j, ..., drop) {
### FIXME:  a better version has only 1st arg in signature
### and uses callNextMethod, when this works with primitives.
    x@y <- x@y[i, j, drop=FALSE]
    x@x <- x@x[i]
    x
})

"testFunc" <-
function(cur) {
    sorted <- cur[order(cur[,1]),]
    sorted[ !is.na(sorted[,1]), ]
}

Nrow <- 1000 # at one time, values this large triggered a bug in gc/protect
## the loop here was a trigger for the bug
Niter <- 10
for(i in 1:Niter)  {
    yy <- matrix(stats::rnorm(10*Nrow), 10, Nrow)
    tDF <- as.data.frame(yy)
    testFunc(tDF)
}

tMC <- new("trackMultiCurve", x=seq_len(Nrow), y = yy)
## not enough functions have methods for this class to use testFunc

stopifnot(identical(tMC[1:10, 1:10]@y, yy[1:10, 1:10]))

## verify we can remove methods and generic

removeMethods("-")
removeMethod("length", "track")
removeMethods("Arith")
removeMethods("Compare")

## repeat the test one more time on the primitives

length(ISOdate(1990, 12, 1)- ISOdate(1980, 12, 1))

removeMethods("length")

## methods for %*%, which isn't done by the same C code as other ops

setClass("foo", representation(m="matrix"))
m1 <- matrix(1:12,3,4)
f1 = new("foo", m=m1)
f2 = new("foo", m=t(m1))

setMethod("%*%", c("foo", "foo"),
 function(x,y)callGeneric(x@m, y@m))

stopifnot(identical(f1%*%f2, m1%*% t(m1)))

removeMethods("%*%")

removeMethods("plot")

## Hold until removeMethods revised: stopifnot(existsFunction("plot", FALSE) && !isGeneric("plot", 1))

## methods for plotData
plotData <- function(x, y, ...) plot(x, y, ...)

setGeneric("plotData")

setMethod("plotData", signature(x="track", y="missing"),
  function(x,  y, ...) plot(slot(x, "x"), slot(x, "y"), ...)
)
## and now remove the whole generic
removeGeneric("plotData")

stopifnot(!exists("plotData", 1))

##  Tests of method inheritance & multiple dispatch
setClass("A0", representation(a0 = "numeric"))

setClass("A1", representation("A0", a1 = "character"))

setClass("B0" ,representation(b0 = "numeric"))

setClass("B1", "B0")

setClass("B2", representation("B1", b2 = "logical"))

setClass("AB0", representation("A1", "B2", ab0 = "matrix"))

f1 <- function(x,  y)"ANY"

setGeneric("f1")

setMethod("f1", c("A0", "B1"), function(x, y)"A0 B1")
setMethod("f1", c("B1", "A0"), function(x, y)"B1 A0")

a0 <- new("A0")
a1 <- new("A1")
b0 <- new("B0")
b1 <- new("B1")
b2 <- new("B2")

deparseText <- function(expr)
    paste(deparse(expr), collapse = "\  ")

mustEqual <- function(e1, e2){
    if(!identical(e1, e2))
        stop(paste("!identical(", deparseText(substitute(e1)),
                   ", ", deparseText(substitute(e2)), ")", sep=""))
}

mustEqual(f1(a0, b0), "ANY")
mustEqual(f1(a1,b0), "ANY")
mustEqual(f1(a1,b1), "A0 B1")
mustEqual(f1(b1,a1), "B1 A0")
mustEqual(f1(b1,b1), "ANY")

## remove classes:  order matters so as not to undefine earlier classes
for(.cl in c("AB0", "A1", "A0", "B2", "B1", "B0"))
    removeClass(.cl)

removeGeneric("f1")

## test of nonstandard generic definition

setGeneric("doubleAnything", function(x) {
  methodValue <- standardGeneric("doubleAnything")
  c(methodValue, methodValue)
})

setMethod("doubleAnything", "ANY", function(x)x)

setMethod("doubleAnything", "character",
function(x)paste("<",x,">",sep=""))

mustEqual(doubleAnything(1:10), c(1:10, 1:10))
mustEqual(doubleAnything("junk"), rep("<junk>",2))

removeGeneric("doubleAnything")

## End Don't show



