### Name: swiss
### Title: Swiss Fertility and Socioeconomic Indicators (1888) Data
### Aliases: swiss
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
pairs(swiss, panel = panel.smooth, main = "swiss data",
      col = 3 + (swiss$Catholic > 50))
summary(lm(Fertility ~ . , data = swiss))



