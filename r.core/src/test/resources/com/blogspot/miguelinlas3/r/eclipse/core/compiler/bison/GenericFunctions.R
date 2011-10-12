### Name: GenericFunctions
### Title: Tools for Managing Generic Functions
### Aliases: GenericFunctions isGeneric isGroup removeGeneric getGenerics
###   allGenerics dumpMethod findFunction dumpMethods removeMethods
###   signature setReplaceMethod
### Keywords: programming classes methods

### ** Examples

require(stats) # for lm

## get the function "myFun" -- throw an error if 0 or > 1 versions visible:
findFuncStrict <- function(fName) {
  allF <- findFunction(fName)
  if(length(allF) == 0)
    stop("No versions of ",fName," visible")
  else if(length(allF) > 1)
    stop(fName," is ambiguous: ", length(allF), " versions")
  else
    get(fName, allF[[1]])
}

try(findFuncStrict("myFun"))# Error: no version
lm <- function(x) x+1
try(findFuncStrict("lm"))#    Error: 2 versions
findFuncStrict("findFuncStrict")# just 1 version
rm(lm)

## Don't show: 
## because nosegfault runs standardGeneric w/o the methods package, nothing
## really gets tested.  The following check that it catches some errors
mustDie <- function(expr) stopifnot(is(trySilent(expr), "try-error"))

mustDie(standardGeneric()) # 3 tests of requiring a single string
mustDie(standardGeneric(NULL))
mustDie(standardGeneric(""))
mustDie(standardGeneric("notAGenericFunction"))
mustDie(standardGeneric("show"))  # a generic, but not called from its body
## End Don't show

## method dumping ------------------------------------

setClass("A", representation(a="numeric"))
setMethod("plot", "A", function(x,y,...){ cat("A meth\n") })
dumpMethod("plot","A", file="")
## Not run: 
##D setMethod("plot", "A",
##D function (x, y, ...)
##D {
##D     cat("AAAAA\n")
##D }
##D )
## End(Not run)
tmp <- tempfile()
dumpMethod("plot","A", file=tmp)
## now remove, and see if we can parse the dump
stopifnot(removeMethod("plot", "A"))
source(tmp)
stopifnot(is(getMethod("plot", "A"), "MethodDefinition"))

## same with dumpMethods() :
setClass("B", contains="A")
setMethod("plot", "B", function(x,y,...){ cat("B ...\n") })
dumpMethods("plot", file=tmp)
stopifnot(removeMethod("plot", "A"),
          removeMethod("plot", "B"))
source(tmp)
stopifnot(is(getMethod("plot", "A"), "MethodDefinition"),
          is(getMethod("plot", "B"), "MethodDefinition"))



