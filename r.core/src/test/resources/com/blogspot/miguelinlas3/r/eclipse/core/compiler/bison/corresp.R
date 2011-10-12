### Name: corresp
### Title: Simple Correspondence Analysis
### Aliases: corresp corresp.xtabs corresp.data.frame corresp.default
###   corresp.factor corresp.formula corresp.matrix
### Keywords: category multivariate

### ** Examples

(ct <- corresp(~ Age + Eth, data = quine))
## Not run: plot(ct)

corresp(caith)
biplot(corresp(caith, nf = 2))



