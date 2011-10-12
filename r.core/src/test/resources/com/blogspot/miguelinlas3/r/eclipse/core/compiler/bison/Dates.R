### Name: Dates
### Title: Date Class
### Aliases: Date Dates print.Date summary.Date Math.Date Summary.Date
###   [.Date [<-.Date [[.Date as.data.frame.Date c.Date mean.Date
###   split.Date
### Keywords: utilities chron

### ** Examples

(today <- Sys.Date())
format(today, "%d %b %Y")  # with month as a word
(tenweeks <- seq(today, length.out=10, by="1 week")) # next ten weeks
weekdays(today)
months(tenweeks)
as.Date(.leap.seconds)



