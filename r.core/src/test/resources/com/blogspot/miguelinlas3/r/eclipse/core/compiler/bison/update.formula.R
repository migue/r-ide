### Name: update.formula
### Title: Model Updating
### Aliases: update.formula
### Keywords: models

### ** Examples

update(y ~ x,    ~ . + x2) #> y ~ x + x2
update(y ~ x, log(.) ~ . ) #> log(y) ~ x



