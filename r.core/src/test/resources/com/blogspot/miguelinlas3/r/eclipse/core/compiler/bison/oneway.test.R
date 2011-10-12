### Name: oneway.test
### Title: Test for Equal Means in a One-Way Layout
### Aliases: oneway.test
### Keywords: htest

### ** Examples

## Not assuming equal variances
oneway.test(extra ~ group, data = sleep)
## Assuming equal variances
oneway.test(extra ~ group, data = sleep, var.equal = TRUE)
## which gives the same result as
anova(lm(extra ~ group, data = sleep))



