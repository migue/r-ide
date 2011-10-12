### Name: hist.POSIXt
### Title: Histogram of a Date or Date-Time Object
### Aliases: hist.POSIXt hist.Date
### Keywords: chron dplot hplot

### ** Examples

hist(.leap.seconds, "years", freq = TRUE)
hist(.leap.seconds,
     seq(ISOdate(1970, 1, 1), ISOdate(2010, 1, 1), "5 years"))

## 100 random dates in a 10-week period
random.dates <- as.Date("2001/1/1") + 70*stats::runif(100)
hist(random.dates, "weeks", format = "%d %b")



