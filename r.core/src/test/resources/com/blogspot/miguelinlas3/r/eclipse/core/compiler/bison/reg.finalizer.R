### Name: reg.finalizer
### Title: Finalization of Objects
### Aliases: reg.finalizer
### Keywords: programming environment

### ** Examples

f <- function(e) print("cleaning....")
g <- function(x){ e <- environment(); reg.finalizer(e,f) }
g()
invisible(gc()) # trigger cleanup



