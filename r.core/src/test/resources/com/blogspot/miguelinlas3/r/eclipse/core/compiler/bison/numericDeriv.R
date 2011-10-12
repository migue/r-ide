### Name: numericDeriv
### Title: Evaluate derivatives numerically
### Aliases: numericDeriv
### Keywords: models

### ** Examples

myenv <- new.env()
assign("mean", 0., envir = myenv)
assign("sd", 1., envir = myenv)
assign("x", seq(-3., 3., len = 31), envir = myenv)
numericDeriv(quote(pnorm(x, mean, sd)), c("mean", "sd"), myenv)



