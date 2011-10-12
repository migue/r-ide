### Name: body
### Title: Access to and Manipulation of the Body of a Function
### Aliases: body body<-
### Keywords: programming

### ** Examples

body(body)
f <- function(x) x^5
body(f) <- expression(5^x)
## or equivalently  body(f) <- list(quote(5^x))
f(3) # = 125
body(f)



