### Name: getMethod
### Title: Get or Test for the Definition of a Method
### Aliases: getMethod findMethod existsMethod selectMethod hasMethod
### Keywords: programming classes methods

### ** Examples

setGeneric("testFun", function(x)standardGeneric("testFun"))
setMethod("testFun", "numeric", function(x)x+1)
hasMethod("testFun", "numeric")
## Not run: [1] TRUE
hasMethod("testFun", "integer") #inherited
## Not run: [1] TRUE
existsMethod("testFun", "integer")
## Not run: [1] FALSE
hasMethod("testFun") # default method
## Not run: [1] FALSE
hasMethod("testFun", "ANY")
## Not run: [1] FALSE
## Don't show: 
stopifnot(isGeneric("testFun"),
          hasMethod("testFun", "numeric"),
          hasMethod("testFun", "integer"),
          !existsMethod("testFun", "integer"),
          !hasMethod("testFun"),
          !hasMethod("testFun", "ANY") )
removeGeneric("testFun")
## End Don't show



