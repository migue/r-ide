### Name: JohnsonJohnson
### Title: Quarterly Earnings per Johnson & Johnson Share
### Aliases: JohnsonJohnson
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
JJ <- log10(JohnsonJohnson)
plot(JJ)
(fit <- StructTS(JJ, type="BSM"))
tsdiag(fit)
sm <- tsSmooth(fit)
plot(cbind(JJ, sm[, 1], sm[, 3]-0.5), plot.type = "single",
     col = c("black", "green", "blue"))
abline(h = -0.5, col = "grey60")

monthplot(fit)



