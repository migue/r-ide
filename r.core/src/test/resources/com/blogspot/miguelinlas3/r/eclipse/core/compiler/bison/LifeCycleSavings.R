### Name: LifeCycleSavings
### Title: Intercountry Life-Cycle Savings Data
### Aliases: LifeCycleSavings
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
pairs(LifeCycleSavings, panel = panel.smooth,
      main = "LifeCycleSavings data")
fm1 <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
summary(fm1)



