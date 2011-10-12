### Name: methods
### Title: List Methods for S3 Generic Functions or Classes
### Aliases: methods print.MethodsFunction
### Keywords: methods

### ** Examples

require(stats)

methods(summary)
methods(class = "aov")
methods("[[")    # uses C-internal dispatching
methods("$")
methods("$<-")   # replacement function
methods("+")     # binary operator
methods("Math")  # group generic
require(graphics)
methods("axis")  # looks like it has methods, but not generic
## Not run: 
##D methods(print)   # over 100
## End(Not run)
## --> help(showMethods) for related examples



