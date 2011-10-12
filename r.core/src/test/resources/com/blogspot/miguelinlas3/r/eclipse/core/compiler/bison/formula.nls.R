### Name: formula.nls
### Title: Extract Model Formula from nls Object
### Aliases: formula.nls
### Keywords: models

### ** Examples

fm1 <- nls(circumference ~ A/(1+exp((B-age)/C)), Orange,
           start = list(A=160, B=700, C = 350))
formula(fm1)



