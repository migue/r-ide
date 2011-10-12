### Name: chull
### Title: Compute Convex Hull of a Set of Points
### Aliases: chull
### Keywords: graphs

### ** Examples

require(stats)
X <- matrix(rnorm(2000), ncol = 2)
chull(X)
## Not run: 
##D   # Example usage from graphics package
##D   plot(X, cex = 0.5)
##D   hpts <- chull(X)
##D   hpts <- c(hpts, hpts[1])
##D   lines(X[hpts, ])
## End(Not run)



