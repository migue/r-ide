### Name: duplicated
### Title: Determine Duplicate Elements
### Aliases: duplicated duplicated.default duplicated.data.frame
###   duplicated.matrix duplicated.array
### Keywords: logic manip

### ** Examples

x <- c(9:20, 1:5, 3:7, 0:8)
## extract unique elements
(xu <- x[!duplicated(x)])
## similar, but not the same:
(xu2 <- x[!duplicated(x, fromLast = TRUE)])

## xu == unique(x) but unique(x) is more efficient
stopifnot(identical(xu,  unique(x)),
          identical(xu2, unique(x, fromLast = TRUE)))

duplicated(iris)[140:143]

duplicated(iris3, MARGIN = c(1, 3))



