### Name: dotsMethods
### Title: The Use of "..." in Method Signatures
### Aliases: dotsMethods
### Keywords: programming classes methods

### ** Examples

cc <- function(...)c(...)

setGeneric("cc")

setMethod("cc", "character", function(...)paste(...))

setClassUnion("Number", c("numeric", "complex"))

setMethod("cc", "Number", function(...) sum(...))

setClass("cdate", contains = "character", representation(date = "Date"))

setClass("vdate", contains = "vector", representation(date = "Date"))

cd1 = new("cdate", "abcdef", date = Sys.Date())

cd2 = new("vdate", "abcdef", date = Sys.Date())

stopifnot(identical(cc(letters, character(), cd1), paste(letters, character(), cd1))) # the "character" method

stopifnot(identical(cc(letters, character(), cd2), c(letters, character(), cd2))) # the default, because "vdate" doesn't extend "character"

stopifnot(identical(cc(1:10, 1+1i), sum(1:10, 1+1i))) # the "Number" method

stopifnot(identical(cc(1:10, 1+1i, TRUE), c(1:10, 1+1i, TRUE))) # the default

stopifnot(identical(cc(), c())) # no arguments implies the default method

setGeneric("numMax", function(...)standardGeneric("numMax"))

setMethod("numMax", "numeric", function(...)max(...)) # won't work for complex data
setMethod("numMax", "Number", function(...) paste(...)) # should not be selected w/o complex args

stopifnot(identical(numMax(1:10, pi, 1+1i), paste(1:10, pi, 1+1i)))
stopifnot(identical(numMax(1:10, pi, 1), max(1:10, pi, 1)))

try(numMax(1:10, pi, TRUE)) # should be an error:  no default method

## A generic version of paste(), dispatching on the "..." argument:
setGeneric("paste", signature = "...")

setMethod("paste", "Number", function(..., sep, collapse) c(...))

stopifnot(identical(paste(1:10, pi, 1), c(1:10, pi, 1)))

## Don't show: 
for(gen in c("numMax", "cc", "paste")) removeGeneric(gen)
for(cl in c("Number", "vdate", "cdate")) removeClass(cl)
## End Don't show



