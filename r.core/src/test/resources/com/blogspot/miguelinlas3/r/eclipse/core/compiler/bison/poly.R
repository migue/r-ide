### Name: poly
### Title: Compute Orthogonal Polynomials
### Aliases: poly polym predict.poly makepredictcall.poly
### Keywords: math

### ** Examples

(z <- poly(1:10, 3))
predict(z, seq(2, 4, 0.5))
poly(seq(4, 6, 0.5), 3, coefs = attr(z, "coefs"))

polym(1:4, c(1, 4:6), degree=3) # or just poly()
poly(cbind(1:4, c(1, 4:6)), degree=3)



