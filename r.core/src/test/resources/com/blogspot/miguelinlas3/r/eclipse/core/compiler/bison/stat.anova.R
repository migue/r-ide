### Name: stat.anova
### Title: GLM Anova Statistics
### Aliases: stat.anova
### Keywords: regression models

### ** Examples

##-- Continued from '?glm':
## Don't show: 
utils::example("glm", echo = FALSE)
## End Don't show
print(ag <- anova(glm.D93))
stat.anova(ag$table, test = "Cp",
           scale = sum(resid(glm.D93, "pearson")^2)/4,
           df.scale = 4, n = 9)



