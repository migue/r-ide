### Name: is.language
### Title: Is an Object a Language Object?
### Aliases: is.language
### Keywords: programming

### ** Examples

ll <- list(a = expression(x^2 - 2*x + 1), b = as.name("Jim"),
           c = as.expression(exp(1)), d = call("sin", pi))
sapply(ll, typeof)
sapply(ll, mode)
stopifnot(sapply(ll, is.language))



