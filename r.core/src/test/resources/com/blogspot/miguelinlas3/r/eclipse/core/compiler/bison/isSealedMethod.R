### Name: isSealedMethod
### Title: Check for a Sealed Method or Class
### Aliases: isSealedMethod isSealedClass
### Keywords: programming classes classes methods

### ** Examples

## these are both TRUE
isSealedMethod("+", c("numeric", "character"))
isSealedClass("matrix")

setClass("track",
            representation(x="numeric", y="numeric"))
## but this is FALSE
isSealedClass("track")
## and so is this
isSealedClass("A Name for an undefined Class")
## and so are these, because only one of the two arguments is basic
isSealedMethod("+", c("track", "numeric"))
isSealedMethod("+", c("numeric", "track"))

## Don't show: 
removeClass("track")
## End Don't show



