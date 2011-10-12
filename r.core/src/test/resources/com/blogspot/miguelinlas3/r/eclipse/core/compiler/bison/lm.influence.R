### Name: lm.influence
### Title: Regression Diagnostics
### Aliases: lm.influence influence influence.lm influence.glm
### Keywords: regression

### ** Examples

## Analysis of the life-cycle savings data
## given in Belsley, Kuh and Welsch.
summary(lm.SR <- lm(sr ~ pop15 + pop75 + dpi + ddpi,
                    data = LifeCycleSavings),
        corr = TRUE)
utils::str(lmI <- lm.influence(lm.SR))

## For more "user level" examples, use example(influence.measures)



