### Name: loglin
### Title: Fitting Log-Linear Models
### Aliases: loglin
### Keywords: category models

### ** Examples

## Model of joint independence of sex from hair and eye color.
fm <- loglin(HairEyeColor, list(c(1, 2), c(1, 3), c(2, 3)))
fm
1 - pchisq(fm$lrt, fm$df)
## Model with no three-factor interactions fits well.



