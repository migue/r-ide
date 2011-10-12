### Name: qqnorm.lme
### Title: Normal Plot of Residuals or Random Effects from an lme Object
### Aliases: qqnorm.lm qqnorm.lme qqnorm.lmList qqnorm.nls
### Keywords: models

### ** Examples

## Not run: 
##D fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
##D # normal plot of standardized residuals by gender
##D qqnorm(fm1, ~ resid(., type = "p") | Sex, abline = c(0, 1))
##D # normal plots of random effects
##D qqnorm(fm1, ~ranef(.))
## End(Not run)



