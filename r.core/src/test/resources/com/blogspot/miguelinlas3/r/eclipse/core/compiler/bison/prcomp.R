### Name: prcomp
### Title: Principal Components Analysis
### Aliases: prcomp prcomp.formula prcomp.default plot.prcomp
###   predict.prcomp print.prcomp summary.prcomp print.summary.prcomp
### Keywords: multivariate

### ** Examples

require(graphics)

## the variances of the variables in the
## USArrests data vary by orders of magnitude, so scaling is appropriate
prcomp(USArrests)  # inappropriate
prcomp(USArrests, scale = TRUE)
prcomp(~ Murder + Assault + Rape, data = USArrests, scale = TRUE)
plot(prcomp(USArrests))
summary(prcomp(USArrests, scale = TRUE))
biplot(prcomp(USArrests, scale = TRUE))



