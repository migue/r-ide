### Name: chol2inv
### Title: Inverse from Choleski (or QR) Decomposition
### Aliases: chol2inv
### Keywords: algebra array

### ** Examples

cma <- chol(ma  <- cbind(1, 1:3, c(1,3,7)))
ma %*% chol2inv(cma)



