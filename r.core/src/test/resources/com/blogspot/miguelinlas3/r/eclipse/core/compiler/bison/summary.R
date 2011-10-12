### Name: summary
### Title: Object Summaries
### Aliases: summary summary.default summary.data.frame summary.factor
###   summary.matrix
### Keywords: methods

### ** Examples

summary(attenu, digits = 4) #-> summary.data.frame(...), default precision
summary(attenu $ station, maxsum = 20) #-> summary.factor(...)

lst <- unclass(attenu$station) > 20 # logical with NAs
## summary.default() for logicals -- different from *.factor:
summary(lst)
summary(as.factor(lst))



