### Name: lsfit
### Title: Find the Least Squares Fit
### Aliases: lsfit
### Keywords: regression

### ** Examples

## Don't show: 
utils::example("lm", echo = FALSE)
## End Don't show
##-- Using the same data as the lm(.) example:
lsD9 <- lsfit(x = unclass(gl(2,10)), y = weight)
ls.print(lsD9)



