### Name: Loblolly
### Title: Growth of Loblolly pine trees
### Aliases: Loblolly
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
plot(height ~ age, data = Loblolly, subset = Seed == 329,
     xlab = "Tree age (yr)", las = 1,
     ylab = "Tree height (ft)",
     main = "Loblolly data and fitted curve (Seed 329 only)")
fm1 <- nls(height ~ SSasymp(age, Asym, R0, lrc),
           data = Loblolly, subset = Seed == 329)
summary(fm1)
age <- seq(0, 30, length.out = 101)
lines(age, predict(fm1, list(age = age)))



