### Name: DateTimeClasses
### Title: Date-Time Classes
### Aliases: DateTimeClasses POSIXct POSIXlt POSIXt print.POSIXct
###   print.POSIXlt summary.POSIXct summary.POSIXlt +.POSIXt -.POSIXt
###   Ops.POSIXt Math.POSIXt Summary.POSIXct Math.POSIXlt Summary.POSIXlt
###   [.POSIXct [<-.POSIXct [[.POSIXct [.POSIXlt [<-.POSIXlt
###   as.data.frame.POSIXct as.data.frame.POSIXlt .leap.seconds
###   is.na.POSIXlt all.equal.POSIXct c.POSIXct c.POSIXlt as.matrix.POSIXlt
###   mean.POSIXct mean.POSIXlt str.POSIXt check_tzones duplicated.POSIXlt
###   unique.POSIXlt split.POSIXct date-time
### Keywords: utilities chron

### ** Examples

(z <- Sys.time())             # the current date, as class "POSIXct"

Sys.time() - 3600             # an hour ago

as.POSIXlt(Sys.time(), "GMT") # the current time in GMT
format(.leap.seconds)         # all 23 leapseconds in your timezone
print(.leap.seconds, tz="PST8PDT")  # and in Seattle's



