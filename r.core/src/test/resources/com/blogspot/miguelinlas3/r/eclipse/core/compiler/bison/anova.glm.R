### Name: anova.glm
### Title: Analysis of Deviance for Generalized Linear Model Fits
### Aliases: anova.glm anova.glmlist
### Keywords: models regression

### ** Examples

## --- Continuing the Example from  '?glm':
## Don't show: 
require(utils)
example("glm", echo = FALSE)
## End Don't show
anova(glm.D93)
anova(glm.D93, test = "Cp")
anova(glm.D93, test = "Chisq")



