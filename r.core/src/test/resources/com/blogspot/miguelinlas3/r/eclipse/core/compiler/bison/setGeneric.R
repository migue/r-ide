### Name: setGeneric
### Title: Define a New Generic Function
### Aliases: setGeneric setGroupGeneric
### Keywords: programming methods

### ** Examples

## Don't show: 
setClass("track", representation(x="numeric", y="numeric"))
## End Don't show

## create a new generic function, with a default method
props <- function(object) attributes(object)
setGeneric("props")

## A new generic function with no default method
setGeneric("increment",
  function(object, step, ...)
    standardGeneric("increment")
)

###   A non-standard generic function.  It insists that the methods
###   return a non-empty character vector (a stronger requirement than
###    valueClass = "character" in the call to setGeneric)

setGeneric("authorNames",
    function(text) {
      value <- standardGeneric("authorNames")
      if(!(is(value, "character") && any(nchar(value)>0)))
        stop("authorNames methods must return non-empty strings")
      value
      })

## Don't show: 
setMethod("authorNames", "character", function(text)text)

stopifnot(identical(authorNames(c("me", "you")), c("me", "you")),
          is(trySilent(authorNames(character())), "try-error"), # empty value
          is(trySilent(authorNames(NULL)), "try-error"))        # no default method
## End Don't show

## An example of group generic methods, using the class
## "track"; see the documentation of setClass for its definition

## define a method for the Arith group

setMethod("Arith", c("track", "numeric"),
 function(e1, e2) {
  e1@y <- callGeneric(e1@y , e2)
  e1
})

setMethod("Arith", c("numeric", "track"),
 function(e1, e2) {
  e2@y <- callGeneric(e1, e2@y)
  e2
})

## now arithmetic operators  will dispatch methods:

t1 <- new("track", x=1:10, y=sort(stats::rnorm(10)))

t1 - 100
1/t1

## Don't show: 
removeGeneric("authorNames")
removeClass("track")
removeMethods("Arith")
removeGeneric("props")
removeGeneric("increment")
## End Don't show



