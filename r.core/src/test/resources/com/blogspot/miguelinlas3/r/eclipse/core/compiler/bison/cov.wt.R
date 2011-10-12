### Name: cov.wt
### Title: Weighted Covariance Matrices
### Aliases: cov.wt
### Keywords: multivariate

### ** Examples

 (xy <- cbind(x = 1:10, y = c(1:3, 8:5, 8:10)))
 w1 <- c(0,0,0,1,1,1,1,1,0,0)
 cov.wt(xy, wt = w1) # i.e. method = "unbiased"
 cov.wt(xy, wt = w1, method = "ML", cor = TRUE)



