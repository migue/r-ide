### Name: object.size
### Title: Report the Space Allocated for an Object
### Aliases: object.size
### Keywords: utilities

### ** Examples

object.size(letters)
object.size(ls)
## find the 10 largest objects in the base package
z <- sapply(ls("package:base"), function(x)
            object.size(get(x, envir = baseenv())))
as.matrix(rev(sort(z))[1:10])



