### Name: scale
### Title: Scaling and Centering of Matrix-like Objects
### Aliases: scale scale.default
### Keywords: array

### ** Examples

require(stats)
x <- matrix(1:10, ncol=2)
(centered.x <- scale(x, scale=FALSE))
cov(centered.scaled.x <- scale(x))# all 1



