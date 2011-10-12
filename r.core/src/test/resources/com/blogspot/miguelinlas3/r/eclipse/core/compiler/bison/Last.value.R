### Name: Last.value
### Title: Value of Last Evaluated Expression
### Aliases: .Last.value
### Keywords: programming

### ** Examples

## These will not work correctly from example(),
## but they will in make check or if pasted in,
## as example() does not run them at the top level
gamma(1:15)          # think of some intensive calculation...
fac14 <- .Last.value # keep them

library("splines") # returns invisibly
.Last.value    # shows what library(.) above returned
## Don't show: 
detach("package:splines")
## End Don't show



