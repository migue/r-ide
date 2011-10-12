### Name: callNextMethod
### Title: Call an Inherited Method
### Aliases: callNextMethod
### Keywords: programming classes methods

### ** Examples


## some class definitions with simple inheritance
setClass("B0" , representation(b0 = "numeric"))

setClass("B1", representation(b1 = "character"), contains = "B0")

setClass("B2", representation(b2 = "logical"), contains = "B1")

## and a rather silly function to illustrate callNextMethod

f <- function(x) class(x)

setMethod("f", "B0", function(x) c(x@b0^2, callNextMethod()))
setMethod("f", "B1", function(x) c(paste(x@b1,":"), callNextMethod()))
setMethod("f", "B2", function(x) c(x@b2, callNextMethod()))

b1 <- new("B1", b0 = 2, b1 = "Testing")

b2 <- new("B2", b2 = FALSE, b1 = "More testing", b0 = 10)

f(b2)
stopifnot(identical(f(b2), c(b2@b2, paste(b2@b1,":"), b2@b0^2, "B2")))

f(b1)

## a sneakier method: the *changed* x is used:
setMethod("f", "B2", function(x) {x@b0 <- 111; c(x@b2, callNextMethod())})
f(b2)
stopifnot(identical(f(b2), c(b2@b2, paste(b2@b1,":"), 111^2, "B2")))

## Don't show: 
## a version of the example with 1 more layer of nesting

## next methods calling next methods, with arguments; using group generics
setMethod("Ops", "B2",
    function(e1, e2) callNextMethod())
setMethod("Ops", c("B0"),
    function(e1, e2) callNextMethod(e1@b0, e2))

b2 + 1 # 11

b1 == 2 # TRUE

removeClass("B2"); removeClass("B1"); removeClass("B0")

removeGeneric("f")

removeMethods("Ops")

## tests of multiple callNextMethod
setClass("m1", representation(count = "numeric"), contains = "matrix",
         prototype = prototype(count = 0))
mm1 <- new("m1", matrix(1:12, 3,4))
setMethod("[", "m1", function(x, i, j, ..., drop) callNextMethod())

setClass("m2", representation(sum = "numeric"), contains = "m1")

setMethod("Ops", c("m1", "m1"), function(e1, e2) {
    as(e1, "matrix") <- callNextMethod()
    e1@count <- max(e1@count, e2@count)+1
    e1})

mm2 <- new("m2", matrix(1:12, 3, 4), sum = sum(1:12))

stopifnot(identical(mm2[,2], 4:6))

setClass("m3", representation(rowtags = "character"),contains = "m2")

setMethod("[", signature(x="m3", i = "character", j = "missing", drop = "missing"),
          function(x, i,j, ..., drop) {
              xx <- callNextMethod(x, match(i, x@rowtags),)
              x@.Data <- xx
              x@rowtags <- x@rowtags[match(i, x@rowtags)]
              x})

tm = matrix(1:12, 4, 3)

mm3 = new("m3", tm, rowtags = letters[1:4])

mmm = mm3[c("b", "d")]

stopifnot(identical(mmm, new("m3", tm[c(2, 4),], rowtags = c("b", "d"))))

removeClass("m3")
removeClass("m2")
removeClass("m1")

removeMethods("[")

## End Don't show




