### Name: plot.rpart
### Title: Plot an Rpart Object
### Aliases: plot.rpart
### Keywords: tree

### ** Examples

fit <- rpart(Price ~ Mileage + Type + Country, cu.summary)
plot(fit, compress=TRUE)
text(fit, use.n=TRUE)



