### Name: conflicts
### Title: Search for Masked Objects on the Search Path
### Aliases: conflicts
### Keywords: utilities

### ** Examples

lm <- 1:3
conflicts(, TRUE)
## gives something like
# $.GlobalEnv
# [1] "lm"
#
# $package:base
# [1] "lm"

## Remove things from your "workspace" that mask others:
remove(list = conflicts(detail=TRUE)$.GlobalEnv)



