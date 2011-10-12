### Name: warning
### Title: Warning Messages
### Aliases: warning suppressWarnings
### Keywords: programming error

### ** Examples

## Don't show: 
oldopt <- options(warn=1)
## End Don't show
testit <- function() warning("testit")
testit() ## shows call
testit <- function() warning("problem in testit", call. = FALSE)
testit() ## no call
suppressWarnings(warning("testit"))
## Don't show: 
eigenval <- 10 ^ -stats::rnorm(1, mean=6)
if(eigenval < 1.e-7) warning("system near singular")
options(oldopt)
## End Don't show



