### Name: as.POSIX*
### Title: Date-time Conversion Functions
### Aliases: as.POSIXct as.POSIXct.default as.POSIXct.POSIXlt
###   as.POSIXct.date as.POSIXct.dates as.POSIXct.Date as.POSIXct.numeric
###   as.POSIXlt as.POSIXlt.Date as.POSIXlt.date as.POSIXlt.dates
###   as.POSIXlt.POSIXct as.POSIXlt.factor as.POSIXlt.character
###   as.POSIXlt.default as.POSIXlt.numeric as.double.POSIXlt
### Keywords: utilities chron

### ** Examples

(z <- Sys.time())             # the current datetime, as class "POSIXct"
unclass(z)                    # a large integer
floor(unclass(z)/86400)       # the number of days since 1970-01-01
(z <- as.POSIXlt(Sys.time())) # the current datetime, as class "POSIXlt"
unlist(unclass(z))            # a list shown as a named vector

## suppose we have a time in seconds since 1960-01-01 00:00:00 GMT
z <- 1472562988
# ways to convert this
as.POSIXct(z, origin="1960-01-01")                # local
as.POSIXct(z, origin="1960-01-01", tz="GMT")      # in UTC
as.POSIXct(z, origin=ISOdatetime(1960,1,1,0,0,0)) # local
ISOdatetime(1960,1,1,0,0,0) + z                   # local

## SPSS dates (R-help 2006-02-17)
z <- c(10485849600, 10477641600, 10561104000, 10562745600)
as.Date(as.POSIXct(z, origin="1582-10-14", tz="GMT"))

as.POSIXlt(Sys.time(), "GMT") # the current time in UTC
## Not run: 
##D ## These may not be correct names on your system
##D as.POSIXlt(Sys.time(), "America/New_York")  # in New York
##D as.POSIXlt(Sys.time(), "EST5EDT")           # alternative.
##D as.POSIXlt(Sys.time(), "EST" )   # somewhere in Eastern Canada
##D as.POSIXlt(Sys.time(), "HST")    # in Hawaii
##D as.POSIXlt(Sys.time(), "Australia/Darwin")
## End(Not run)



