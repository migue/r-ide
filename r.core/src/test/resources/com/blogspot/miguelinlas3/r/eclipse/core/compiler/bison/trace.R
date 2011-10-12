### Name: trace
### Title: Interactive Tracing and Debugging of Calls to a Function or
###   Method
### Aliases: trace untrace tracingState .doTrace .primTrace .primUntrace
### Keywords: programming debugging

### ** Examples

require(graphics)

##  Very simple use
trace(sum)
hist(stats::rnorm(100)) # shows about 3-4 calls to sum()
untrace(sum)

if(.isMethodsDispatchOn()) { # non-simple use needs 'methods' package

f <- function(x, y) {
    y <- pmax(y, .001)
    x ^ y
}

## arrange to call the browser on entering and exiting
## function f
trace("f", browser, exit = browser)

## instead, conditionally assign some data, and then browse
## on exit, but only then.  Don't bother me otherwise

trace("f", quote(if(any(y < 0)) yOrig <- y),
      exit = quote(if(exists("yOrig")) browser()),
      print = FALSE)

## trace a utility function, with recover so we
## can browse in the calling functions as well.

trace("as.matrix", recover)

## turn off the tracing

untrace(c("f", "as.matrix"))

## Not run: 
##D ## trace calls to the function lm() that come from
##D ## the nlme package.
##D ## (The function nlme is in that package, and the package
##D ## has a name space, so the where= argument must be used
##D ## to get the right version of lm)
##D 
##D trace(lm, exit = recover, where = nlme)
## End(Not run)
}



