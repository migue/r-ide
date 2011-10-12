### Name: formula
### Title: Model Formulae
### Aliases: formula formula.default formula.formula formula.terms
###   formula.data.frame as.formula print.formula [.formula
### Keywords: models

### ** Examples

class(fo <- y ~ x1*x2) # "formula"
fo
typeof(fo)# R internal : "language"
terms(fo)

environment(fo)
environment(as.formula("y ~ x"))
environment(as.formula("y ~ x", env=new.env()))

## Create a formula for a model with a large number of variables:
xnam <- paste("x", 1:25, sep="")
(fmla <- as.formula(paste("y ~ ", paste(xnam, collapse= "+"))))



