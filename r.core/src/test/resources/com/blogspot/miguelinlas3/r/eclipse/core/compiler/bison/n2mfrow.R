### Name: n2mfrow
### Title: Compute Default mfrow From Number of Plots
### Aliases: n2mfrow
### Keywords: dplot utilities

### ** Examples

require(graphics)

n2mfrow(8) # 3 x 3

n <- 5 ; x <- seq(-2,2, len=51)
## suppose now that 'n' is not known {inside function}
op <- par(mfrow = n2mfrow(n))
for (j in 1:n)
   plot(x, x^j, main = substitute(x^ exp, list(exp = j)), type = "l",
   col = "blue")

sapply(1:10, n2mfrow)



