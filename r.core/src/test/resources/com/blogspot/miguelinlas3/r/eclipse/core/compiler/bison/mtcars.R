### Name: mtcars
### Title: Motor Trend Car Road Tests
### Aliases: mtcars
### Keywords: datasets

### ** Examples

require(graphics)
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)



