### Name: add1
### Title: Add or Drop All Possible Single Terms to a Model
### Aliases: add1 add1.default add1.lm add1.glm drop1 drop1.default
###   drop1.lm drop1.glm
### Keywords: models

### ** Examples

require(graphics); require(utils)
example(step)#-> swiss
add1(lm1, ~ I(Education^2) + .^2)
drop1(lm1, test="F")  # So called 'type II' anova

example(glm)
drop1(glm.D93, test="Chisq")
drop1(glm.D93, test="F")



