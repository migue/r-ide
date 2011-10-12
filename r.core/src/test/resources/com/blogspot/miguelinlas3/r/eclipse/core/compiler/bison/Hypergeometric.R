### Name: Hypergeometric
### Title: The Hypergeometric Distribution
### Aliases: Hypergeometric dhyper phyper qhyper rhyper
### Keywords: distribution

### ** Examples

m <- 10; n <- 7; k <- 8
x <- 0:(k+1)
rbind(phyper(x, m, n, k), dhyper(x, m, n, k))
all(phyper(x, m, n, k) == cumsum(dhyper(x, m, n, k)))# FALSE
## but error is very small:
signif(phyper(x, m, n, k) - cumsum(dhyper(x, m, n, k)), digits=3)



