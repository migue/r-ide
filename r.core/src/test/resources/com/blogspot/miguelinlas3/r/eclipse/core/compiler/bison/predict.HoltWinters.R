### Name: predict.HoltWinters
### Title: prediction function for fitted Holt-Winters models
### Aliases: predict.HoltWinters
### Keywords: ts

### ** Examples

require(graphics)

m <- HoltWinters(co2)
p <- predict(m, 50, prediction.interval = TRUE)
plot(m, p)



