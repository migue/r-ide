### Name: bquote
### Title: Partial substitution in expressions
### Aliases: bquote
### Keywords: programming data

### ** Examples

require(graphics)

a <- 2

bquote(a == a)
quote(a == a)

bquote(a == .(a))
substitute(a == A, list(A = a))

plot(1:10, a*(1:10), main = bquote(a == .(a)))



