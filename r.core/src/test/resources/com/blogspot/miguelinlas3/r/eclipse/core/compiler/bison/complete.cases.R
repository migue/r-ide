### Name: complete.cases
### Title: Find Complete Cases
### Aliases: complete.cases
### Keywords: NA logic

### ** Examples

x <- airquality[, -1] # x is a regression design matrix
y <- airquality[,  1] # y is the corresponding response

stopifnot(complete.cases(y) != is.na(y))
ok <- complete.cases(x,y)
sum(!ok) # how many are not "ok" ?
x <- x[ok,]
y <- y[ok]



