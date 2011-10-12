### Name: ls.diag
### Title: Compute Diagnostics for `lsfit' Regression Results
### Aliases: ls.diag
### Keywords: regression

### ** Examples

## Don't show: 
utils::example("lm", echo = FALSE)
## End Don't show
##-- Using the same data as the lm(.) example:
lsD9 <- lsfit(x = as.numeric(gl(2, 10, 20)), y = weight)
dlsD9 <- ls.diag(lsD9)
utils::str(dlsD9, give.attr=FALSE)
abs(1 - sum(dlsD9$hat) / 2) < 10*.Machine$double.eps # sum(h.ii) = p
plot(dlsD9$hat, dlsD9$stud.res, xlim=c(0,0.11))
abline(h = 0, lty = 2, col = "lightgray")



