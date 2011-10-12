### Name: VarCorr
### Title: Extract variance and correlation components
### Aliases: VarCorr VarCorr.lme VarCorr.pdMat VarCorr.pdBlocked
###   summary.VarCorr.lme print.VarCorr.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, data = Orthodont, random = ~age)
VarCorr(fm1)



