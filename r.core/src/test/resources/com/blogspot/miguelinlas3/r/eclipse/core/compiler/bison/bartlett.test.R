### Name: bartlett.test
### Title: Bartlett Test of Homogeneity of Variances
### Aliases: bartlett.test bartlett.test.default bartlett.test.formula
### Keywords: htest

### ** Examples

require(graphics)

plot(count ~ spray, data = InsectSprays)
bartlett.test(InsectSprays$count, InsectSprays$spray)
bartlett.test(count ~ spray, data = InsectSprays)



