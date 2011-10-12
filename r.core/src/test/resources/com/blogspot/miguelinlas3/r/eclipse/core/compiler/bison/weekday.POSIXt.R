### Name: weekdays
### Title: Extract Parts of a POSIXt or Date Object
### Aliases: weekdays weekdays.POSIXt weekdays.Date months months.POSIXt
###   months.Date quarters quarters.POSIXt quarters.Date julian
###   julian.POSIXt julian.Date
### Keywords: chron

### ** Examples

weekdays(.leap.seconds)
months(.leap.seconds)
quarters(.leap.seconds)

## Julian Day Number (JDN, http://en.wikipedia.org/wiki/Julian_day)
## is the number of days since noon UTC on the first day of 4317 BC.
julian(Sys.Date(), -2440588) # for a day
floor(as.numeric(julian(Sys.time())) + 2440587.5) # for a date-time



