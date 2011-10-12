### Name: summary.rlm
### Title: Summary Method for Robust Linear Models
### Aliases: summary.rlm print.summary.rlm
### Keywords: robust

### ** Examples

summary(rlm(calls ~ year, data = phones, maxit = 50))
## Not run: 
##D Call:
##D rlm(formula = calls ~ year, data = phones, maxit = 50)
##D 
##D Residuals:
##D    Min     1Q Median     3Q    Max
##D -18.31  -5.95  -1.68  26.46 173.77
##D 
##D Coefficients:
##D             Value    Std. Error t value
##D (Intercept) -102.622   26.553   -3.86
##D year           2.041    0.429    4.76
##D 
##D Residual standard error: 9.03 on 22 degrees of freedom
##D 
##D Correlation of Coefficients:
##D [1] -0.994
##D 
## End(Not run)


