### Name: Harman23.cor
### Title: Harman Example 2.3
### Aliases: Harman23.cor
### Keywords: datasets

### ** Examples

require(stats)
(Harman23.FA <- factanal(factors = 1, covmat = Harman23.cor))
for(factors in 2:4) print(update(Harman23.FA, factors = factors))



