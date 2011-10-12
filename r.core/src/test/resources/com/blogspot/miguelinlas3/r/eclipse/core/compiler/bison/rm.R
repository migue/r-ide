### Name: remove
### Title: Remove Objects from a Specified Environment
### Aliases: rm remove
### Keywords: environment

### ** Examples

tmp <- 1:4
## work with tmp  and cleanup
rm(tmp)

## Not run: 
##D ## remove (almost) everything in the working environment.
##D ## You will get no warning, so don't do this unless you are really sure.
##D rm(list = ls())
## End(Not run)


