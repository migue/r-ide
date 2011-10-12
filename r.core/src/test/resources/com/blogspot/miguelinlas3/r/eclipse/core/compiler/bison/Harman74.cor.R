### Name: Harman74.cor
### Title: Harman Example 7.4
### Aliases: Harman74.cor
### Keywords: datasets

### ** Examples

require(stats)
(Harman74.FA <- factanal(factors = 1, covmat = Harman74.cor))
for(factors in 2:5) print(update(Harman74.FA, factors = factors))
Harman74.FA <- factanal(factors = 5, covmat = Harman74.cor,
                        rotation="promax")
print(Harman74.FA$loadings, sort = TRUE)



