### Name: rev
### Title: Reverse Elements
### Aliases: rev rev.default
### Keywords: manip

### ** Examples

x <- c(1:5,5:3)
## sort into descending order; first more efficiently:
stopifnot(sort(x, decreasing = TRUE) == rev(sort(x)))
stopifnot(rev(1:7) == 7:1)#- don't need 'rev' here



