### Name: relevel
### Title: Reorder Levels of Factor
### Aliases: relevel relevel.default relevel.factor relevel.ordered
### Keywords: utilities models

### ** Examples

warpbreaks$tension <- relevel(warpbreaks$tension, ref="M")
summary(lm(breaks ~ wool + tension, data=warpbreaks))



