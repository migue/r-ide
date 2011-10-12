### Name: exists
### Title: Is an Object Defined?
### Aliases: exists
### Keywords: data

### ** Examples

##  Define a substitute function if necessary:
if(!exists("some.fun", mode="function"))
  some.fun <- function(x) { cat("some.fun(x)\n"); x }
search()
exists("ls", 2) # true even though ls is in pos=3
exists("ls", 2, inherits = FALSE) # false



