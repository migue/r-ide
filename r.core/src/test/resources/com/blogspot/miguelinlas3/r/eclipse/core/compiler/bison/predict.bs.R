### Name: predict.bs
### Title: Evaluate a Spline Basis
### Aliases: predict.bs predict.ns
### Keywords: smooth

### ** Examples

require(stats)
basis <- ns(women$height, df = 5)
newX <- seq(58, 72, length.out = 51)
# evaluate the basis at the new data
predict(basis, newX)



