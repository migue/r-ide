### Name: difftime
### Title: Time Intervals
### Aliases: difftime as.difftime as.double.difftime print.difftime
###   round.difftime format.difftime units.difftime units<-.difftime
###   Ops.difftime *.difftime /.difftime Math.difftime Summary.difftime
###   [.difftime mean.difftime units units<-
### Keywords: utilities chron

### ** Examples

(z <- Sys.time() - 3600)
Sys.time() - z                # just over 3600 seconds.

## time interval between releases of R 1.2.2 and 1.2.3.
ISOdate(2001, 4, 26) - ISOdate(2001, 2, 26)

as.difftime(c("0:3:20", "11:23:15"))
as.difftime(c("3:20", "23:15", "2:"), format= "%H:%M")# 3rd gives NA
(z <- as.difftime(c(0,30,60), units="mins"))
as.numeric(z, units="secs")
as.numeric(z, units="hours")
format(z)



