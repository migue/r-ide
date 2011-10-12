### Name: Uniform
### Title: The Uniform Distribution
### Aliases: Uniform dunif punif qunif runif
### Keywords: distribution

### ** Examples

u <- runif(20)

## The following relations always hold :
punif(u) == u
dunif(u) == 1

var(runif(10000))#- ~ = 1/12 = .08333



