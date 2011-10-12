### Name: randu
### Title: Random Numbers from Congruential Generator RANDU
### Aliases: randu
### Keywords: datasets

### ** Examples

## Not run: 
##D ## We could re-generate the dataset by the following R code
##D seed <- as.double(1)
##D RANDU <- function() {
##D     seed <<- ((2^16 + 3) * seed) %% (2^31)
##D     seed/(2^31)
##D }
##D for(i in 1:400) {
##D     U <- c(RANDU(), RANDU(), RANDU(), RANDU(), RANDU())
##D     print(round(U[1:3], 6))
##D }
## End(Not run)



