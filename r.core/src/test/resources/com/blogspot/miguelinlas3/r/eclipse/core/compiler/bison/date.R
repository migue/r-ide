### Name: date
### Title: System Date and Time
### Aliases: date
### Keywords: utilities

### ** Examples

(d <- date())
nchar(d) == 24

## something similar in the current locale
format(Sys.time(), "%a %b %d %H:%M:%S %Y")



