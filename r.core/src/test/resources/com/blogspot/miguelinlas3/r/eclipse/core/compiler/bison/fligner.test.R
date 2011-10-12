### Name: fligner.test
### Title: Fligner-Killeen Test of Homogeneity of Variances
### Aliases: fligner.test fligner.test.default fligner.test.formula
### Keywords: htest

### ** Examples

require(graphics)

plot(count ~ spray, data = InsectSprays)
fligner.test(InsectSprays$count, InsectSprays$spray)
fligner.test(count ~ spray, data = InsectSprays)
## Compare this to bartlett.test()



