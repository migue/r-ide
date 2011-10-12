### Name: cut.POSIXt
### Title: Convert a Date or Date-Time Object to a Factor
### Aliases: cut.POSIXt cut.Date
### Keywords: manip chron

### ** Examples

## random dates in a 10-week period
cut(ISOdate(2001, 1, 1) + 70*86400*stats::runif(100), "weeks")
cut(as.Date("2001/1/1") + 70*stats::runif(100), "weeks")



