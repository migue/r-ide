### Name: diff
### Title: Lagged Differences
### Aliases: diff diff.default diff.POSIXt diff.Date
### Keywords: arith

### ** Examples

diff(1:10, 2)
diff(1:10, 2, 2)
x <- cumsum(cumsum(1:10))
diff(x, lag = 2)
diff(x, differences = 2)

diff(.leap.seconds)



