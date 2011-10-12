### Name: ToothGrowth
### Title: The Effect of Vitamin C on Tooth Growth in Guinea Pigs
### Aliases: ToothGrowth
### Keywords: datasets

### ** Examples

require(graphics)
coplot(len ~ dose | supp, data = ToothGrowth, panel = panel.smooth,
       xlab = "ToothGrowth data: length vs dose, given type of supplement")



