### Name: t
### Title: Matrix Transpose
### Aliases: t t.default t.data.frame
### Keywords: array

### ** Examples

a <- matrix(1:30, 5,6)
ta <- t(a) ##-- i.e.,  a[i, j] == ta[j, i] for all i,j :
for(j in seq(ncol(a)))
  if(! all(a[, j] == ta[j, ])) stop("wrong transpose")



