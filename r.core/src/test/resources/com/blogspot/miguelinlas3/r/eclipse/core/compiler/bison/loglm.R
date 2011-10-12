### Name: loglm
### Title: Fit Log-Linear Models by Iterative Proportional Scaling
### Aliases: loglm
### Keywords: category models

### ** Examples

# The data frames  Cars93, minn38 and quine are available
# in the MASS package.

# Case 1: frequencies specified as an array.
sapply(minn38, function(x) length(levels(x)))
## hs phs fol sex f
##  3   4   7   2 0
minn38a <- array(0, c(3,4,7,2), lapply(minn38[, -5], levels))
minn38a[data.matrix(minn38[,-5])] <- minn38$fol
fm <- loglm(~1 + 2 + 3 + 4, minn38a)  # numerals as names.
deviance(fm)
##[1] 3711.9
fm1 <- update(fm, .~.^2)
fm2 <- update(fm, .~.^3, print = TRUE)
## 5 iterations: deviation 0.0750732
anova(fm, fm1, fm2)
## Not run: LR tests for hierarchical log-linear models
##D 
##D Model 1:
##D   ~  1 + 2 + 3 + 4
##D Model 2:
##D  .  ~  1 + 2 + 3 + 4 + 1:2 + 1:3 + 1:4 + 2:3 + 2:4 + 3:4
##D Model 3:
##D  .  ~  1 + 2 + 3 + 4 + 1:2 + 1:3 + 1:4 + 2:3 + 2:4 + 3:4 +
##D         1:2:3 + 1:2:4 + 1:3:4 + 2:3:4
##D 
##D           Deviance  df Delta(Dev) Delta(df) P(> Delta(Dev)
##D   Model 1 3711.915 155
##D   Model 2  220.043 108   3491.873        47        0.00000
##D   Model 3   47.745  36    172.298        72        0.00000
##D Saturated    0.000   0     47.745        36        0.09114
##D 
## End(Not run)
# Case 1. An array generated with xtabs.

loglm(~ Type + Origin, xtabs(~ Type + Origin, Cars93))
## Not run: Call:
##D loglm(formula = ~Type + Origin, data = xtabs(~Type + Origin,
##D     Cars93))
##D 
##D Statistics:
##D                     X^2 df  P(> X^2)
##D Likelihood Ratio 18.362  5 0.0025255
##D          Pearson 14.080  5 0.0151101
##D 
## End(Not run)
# Case 2.  Frequencies given as a vector in a data frame
names(quine)
## [1] "Eth"  "Sex"  "Age"  "Lrn"  "Days"
fm <- loglm(Days ~ .^2, quine)
gm <- glm(Days ~ .^2, poisson, quine)  # check glm.
c(deviance(fm), deviance(gm))          # deviances agree
## [1] 1368.7 1368.7
c(fm$df, gm$df)                        # resid df do not!
c(fm$df, gm$df.residual)               # resid df do not!
## [1] 127 128
# The loglm residual degrees of freedom is wrong because of
# a non-detectable redundancy in the model matrix.



