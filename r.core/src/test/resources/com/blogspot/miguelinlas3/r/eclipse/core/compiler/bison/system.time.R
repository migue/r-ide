### Name: system.time
### Title: CPU Time Used
### Aliases: system.time unix.time
### Keywords: utilities

### ** Examples

require(stats)
system.time(for(i in 1:100) mad(runif(1000)))
## Not run: 
##D exT <- function(n = 1000) {
##D   # Purpose: Test if system.time works ok;   n: loop size
##D   system.time(for(i in 1:n) x <- mean(rt(1000, df=4)))
##D }
##D #-- Try to interrupt one of the following (using Ctrl-C / Escape):
##D exT()                 #- about 3 secs on a 1GHz PIII
##D system.time(exT())    #~ +/- same
## End(Not run)


