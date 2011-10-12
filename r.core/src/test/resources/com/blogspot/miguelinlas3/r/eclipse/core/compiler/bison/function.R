### Name: function
### Title: Function Definition
### Aliases: function return
### Keywords: programming

### ** Examples

norm <- function(x) sqrt(x%*%x)
norm(1:4)

## An anonymous function:
(function(x,y){ z <- x^2 + y^2; x+y+z })(0:7, 1)



