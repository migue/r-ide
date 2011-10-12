### Name: Extremes
### Title: Maxima and Minima
### Aliases: max min pmax pmin pmax.int pmin.int
### Keywords: univar arith

### ** Examples

require(stats); require(graphics)
 min(5:1, pi) #-> one number
pmin(5:1, pi) #->  5  numbers

x <- sort(rnorm(100));  cH <- 1.35
pmin(cH, quantile(x)) # no names
pmin(quantile(x), cH) # has names
plot(x, pmin(cH, pmax(-cH, x)), type='b', main= "Huber's function")



