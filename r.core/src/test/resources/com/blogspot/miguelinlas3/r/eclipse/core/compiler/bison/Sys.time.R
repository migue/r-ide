### Name: Sys.time
### Title: Get Current Date and Time
### Aliases: Sys.time Sys.Date
### Keywords: utilities chron

### ** Examples

Sys.time()
## print with possibly greater accuracy:
op <- options(digits.secs=6)
Sys.time()
options(op)

## locale-specific version of date()
format(Sys.time(), "%a %b %d %X %Y")

Sys.Date()



