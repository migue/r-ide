### Name: ginv
### Title: Generalized Inverse of a Matrix
### Aliases: ginv
### Keywords: algebra

### ** Examples

## Not run: 
##D # The function is currently defined as
##D function(X, tol = sqrt(.Machine$double.eps))
##D {
##D ## Generalized Inverse of a Matrix
##D   dnx <- dimnames(X)
##D   if(is.null(dnx)) dnx <- vector("list", 2)
##D   s <- svd(X)
##D   nz <- s$d > tol * s$d[1]
##D   structure(
##D     if(any(nz)) s$v[, nz] %*% (t(s$u[, nz])/s$d[nz]) else X,
##D     dimnames = dnx[2:1])
##D }
## End(Not run)


