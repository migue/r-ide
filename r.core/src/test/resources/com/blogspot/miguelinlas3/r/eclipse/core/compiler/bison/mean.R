### Name: mean
### Title: Arithmetic Mean
### Aliases: mean mean.default mean.data.frame
### Keywords: univar

### ** Examples

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

mean(USArrests, trim = 0.2)



