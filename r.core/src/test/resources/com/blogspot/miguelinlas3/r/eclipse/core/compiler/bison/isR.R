### Name: is.R
### Title: Are we using R, rather than S?
### Aliases: is.R
### Keywords: environment utilities

### ** Examples

x <- stats::runif(20); small <- x < 0.4
## In the early years of R, 'which()' only existed in R:
if(is.R()) which(small) else seq(along=small)[small]



