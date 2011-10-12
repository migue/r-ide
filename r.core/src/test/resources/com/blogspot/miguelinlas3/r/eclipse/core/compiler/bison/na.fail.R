### Name: na.fail
### Title: Handle Missing Values in Objects
### Aliases: na.fail na.fail.default na.omit na.omit.data.frame
###   na.omit.default na.exclude na.exclude.data.frame na.exclude.default
###   na.pass
### Keywords: NA

### ** Examples

DF <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA))
na.omit(DF)
m <- as.matrix(DF)
na.omit(m)
stopifnot(all(na.omit(1:3) == 1:3))  # does not affect objects with no NA's
try(na.fail(DF))#> Error: missing values in ...

options("na.action")



