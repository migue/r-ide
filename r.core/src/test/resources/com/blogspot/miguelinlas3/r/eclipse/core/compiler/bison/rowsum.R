### Name: rowsum
### Title: Give column sums of a matrix or data frame, based on a grouping
###   variable
### Aliases: rowsum rowsum.default rowsum.data.frame
### Keywords: manip

### ** Examples

require(stats)

x <- matrix(runif(100), ncol=5)
group <- sample(1:8, 20, TRUE)
(xsum <- rowsum(x, group))
## Slower versions
tapply(x, list(group[row(x)], col(x)), sum)
t(sapply(split(as.data.frame(x), group), colSums))
aggregate(x, list(group), sum)[-1]



