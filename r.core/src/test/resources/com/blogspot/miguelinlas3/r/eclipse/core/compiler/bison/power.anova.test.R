### Encoding: latin1

### Name: power.anova.test
### Title: Power calculations for balanced one-way analysis of variance
###   tests
### Aliases: power.anova.test
### Keywords: htest

### ** Examples

power.anova.test(groups=4, n=5, between.var=1, within.var=3)
# Power = 0.3535594

power.anova.test(groups=4, between.var=1, within.var=3,
                 power=.80)
# n = 11.92613

## Assume we have prior knowledge of the group means:
groupmeans <- c(120, 130, 140, 150)
power.anova.test(groups = length(groupmeans),
                 between.var=var(groupmeans),
                 within.var=500, power=.90) # n = 15.18834




