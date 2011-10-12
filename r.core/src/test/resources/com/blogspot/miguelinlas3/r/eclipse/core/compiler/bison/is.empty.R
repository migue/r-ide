### Name: is.empty.model
### Title: Check if a Model is Empty
### Aliases: is.empty.model
### Keywords: models

### ** Examples

y <- rnorm(20)
is.empty.model(y ~ 0)
is.empty.model(y ~ -1)
is.empty.model(lm(y ~ 0))



