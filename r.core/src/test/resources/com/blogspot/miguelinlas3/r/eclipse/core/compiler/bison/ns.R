### Name: ns
### Title: Generate a Basis Matrix for Natural Cubic Splines
### Aliases: ns
### Keywords: smooth

### ** Examples

require(stats); require(graphics)
ns(women$height, df = 5)
summary(fm1 <- lm(weight ~ ns(height, df = 5), data = women))

## example of safe prediction
plot(women, xlab = "Height (in)", ylab = "Weight (lb)")
ht <- seq(57, 73, length.out = 200)
lines(ht, predict(fm1, data.frame(height=ht)))



