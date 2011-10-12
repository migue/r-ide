### Name: makepredictcall
### Title: Utility Function for Safe Prediction
### Aliases: makepredictcall makepredictcall.default SafePrediction
### Keywords: models

### ** Examples

require(graphics)

## using poly: this did not work in R < 1.5.0
fm <- lm(weight ~ poly(height, 2), data = women)
plot(women, xlab = "Height (in)", ylab = "Weight (lb)")
ht <- seq(57, 73, len = 200)
lines(ht, predict(fm, data.frame(height=ht)))

## see also example(cars)

## see bs and ns for spline examples.



