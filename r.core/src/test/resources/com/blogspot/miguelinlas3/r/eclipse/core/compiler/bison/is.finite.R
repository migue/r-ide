### Name: is.finite
### Title: Finite, Infinite and NaN Numbers
### Aliases: is.finite is.infinite Inf NaN is.nan finite
### Keywords: programming math

### ** Examples

pi / 0 ## = Inf a non-zero number divided by zero creates infinity
0 / 0  ## =  NaN

1/0 + 1/0# Inf
1/0 - 1/0# NaN

stopifnot(
    1/0 == Inf,
    1/Inf == 0
)
sin(Inf)
cos(Inf)
tan(Inf)



