### Name: txtProgressBar
### Title: Text Progress Bar
### Aliases: txtProgressBar getTxtProgressBar setTxtProgressBar
###   close.txtProgressBar
### Keywords: utilities

### ** Examples
## No test: 
 # slow
testit <- function(x = sort(runif(20)), ...)
{
    pb <- txtProgressBar(...)
    for(i in c(0, x, 1)) {Sys.sleep(0.5); setTxtProgressBar(pb, i)}
    Sys.sleep(1)
    close(pb)
}
testit()
testit(runif(10))
testit(style=3)
## End(No test)


