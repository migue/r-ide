### Name: isSymmetric
### Title: Test if a Matrix or other Object is Symmetric
### Aliases: isSymmetric isSymmetric.matrix
### Keywords: array utilities

### ** Examples

isSymmetric(D3 <- diag(3)) # -> TRUE

D3[2,1] <- 1e-100
D3
isSymmetric(D3) # TRUE
isSymmetric(D3, tol = 0) # FALSE for zero-tolerance



