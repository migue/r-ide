### Name: all
### Title: Are All Values True?
### Aliases: all
### Keywords: logic

### ** Examples

range(x <- sort(round(stats::rnorm(10) - 1.2, 1)))
if(all(x < 0)) cat("all x values are negative\n")

all(logical(0))  # true, as all zero of the elements are true.



