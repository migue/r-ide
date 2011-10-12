### Name: unique
### Title: Extract Unique Elements
### Aliases: unique unique.default unique.data.frame unique.matrix
###   unique.array
### Keywords: manip logic

### ** Examples

x <- c(3:5, 11:8, 8 + 0:5)
(ux <- unique(x))
(u2 <- unique(x, fromLast = TRUE)) # different order
stopifnot(identical(sort(ux), sort(u2)))

length(unique(sample(100, 100, replace=TRUE)))
## approximately 100(1 - 1/e) = 63.21

unique(iris)



