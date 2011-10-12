### Name: gc
### Title: Garbage Collection
### Aliases: gc gcinfo
### Keywords: environment

### ** Examples

gc() #- do it now
gcinfo(TRUE) #-- in the future, show when R does it
x <- integer(100000); for(i in 1:18) x <- c(x,i)
gcinfo(verbose = FALSE)#-- don't show it anymore

gc(TRUE)

gc(reset=TRUE)



