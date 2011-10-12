### Name: relist
### Title: Allow Re-Listing an unlist()ed Object
### Aliases: relist relist.default relist.list relist.factor relist.matrix
###   as.relistable is.relistable unlist.relistable
### Keywords: list manip

### ** Examples

 ipar <- list(mean=c(0, 1), vcov=cbind(c(1, 1), c(1, 0)))
 initial.param <- as.relistable(ipar)
 ul <- unlist(initial.param)
 relist(ul)
 stopifnot(identical(relist(ul), initial.param))



