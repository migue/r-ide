### Name: qqnorm
### Title: Quantile-Quantile Plots
### Aliases: qqnorm qqnorm.default qqplot qqline
### Keywords: hplot distribution

### ** Examples

require(graphics)

y <- rt(200, df = 5)
qqnorm(y); qqline(y, col = 2)
qqplot(y, rt(300, df = 5))

qqnorm(precip, ylab = "Precipitation [in/yr] for 70 US cities")



