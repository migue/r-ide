### Name: isS4
### Title: Test for an S4 object
### Aliases: isS4 asS4
### Keywords: programming

### ** Examples

## Don't show: 
require(methods)
## End Don't show
isS4(pi) # FALSE
isS4(getClass("MethodDefinition")) # TRUE
## Don't show: 
stopifnot(isS4(asS4(Sys.time())))
stopifnot(!isS4(asS4(getClass("MethodDefinition"), FALSE)))
## End Don't show



