### Name: order
### Title: Ordering Permutation
### Aliases: order sort.list
### Keywords: univar manip

### ** Examples

require(stats)

(ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <-c(2,1:9)))
## 6  5  2  1  7  4 10  8  3  9
rbind(x,y,z)[,ii] # shows the reordering (ties via 2nd & 3rd arg)

## Suppose we wanted descending order on y.
## A simple solution for numeric 'y' is
rbind(x,y,z)[, order(x, -y, z)]
## More generally we can make use of xtfrm
cy <- as.character(y)
rbind(x,y,z)[, order(x, -xtfrm(cy), z)]

## Sorting data frames:
dd <- transform(data.frame(x,y,z),
                z = factor(z, labels=LETTERS[9:1]))
## Either as above {for factor 'z' : using internal coding}:
dd[ order(x, -y, z) ,]
## or along 1st column, ties along 2nd, ... *arbitrary* no.{columns}:
dd[ do.call(order, dd) ,]

set.seed(1)# reproducible example:
d4 <- data.frame(x = round(   rnorm(100)), y = round(10*runif(100)),
                 z = round( 8*rnorm(100)), u = round(50*runif(100)))
(d4s <- d4[ do.call(order, d4) ,])
(i <- which(diff(d4s[,3]) == 0))
#   in 2 places, needed 3 cols to break ties:
d4s[ rbind(i,i+1), ]

## rearrange matched vectors so that the first is in ascending order
x <- c(5:1, 6:8, 12:9)
y <- (x - 5)^2
o <- order(x)
rbind(x[o], y[o])

## tests of na.last
a <- c(4, 3, 2, NA, 1)
b <- c(4, NA, 2, 7, 1)
z <- cbind(a, b)
(o <- order(a, b)); z[o, ]
(o <- order(a, b, na.last = FALSE)); z[o, ]
(o <- order(a, b, na.last = NA)); z[o, ]

## Not run: 
##D ##  speed examples for long vectors:
##D x <- factor(sample(letters, 1e6, replace=TRUE))
##D system.time(o <- sort.list(x)) ## 1.2 secs
##D stopifnot(!is.unsorted(x[o]))
##D system.time(o <- sort.list(x, method="quick", na.last=NA)) # 0.15 sec
##D stopifnot(!is.unsorted(x[o]))
##D system.time(o <- sort.list(x, method="radix")) # 0.02 sec
##D stopifnot(!is.unsorted(x[o]))
##D xx <- sample(1:26, 1e7, replace=TRUE)
##D system.time(o <- sort.list(xx, method="radix")) # 0.2 sec
##D xx <- sample(1:100000, 1e7, replace=TRUE)
##D system.time(o <- sort.list(xx, method="radix")) # 0.8 sec
##D system.time(o <- sort.list(xx, method="quick", na.last=NA)) # 1.4 sec
## End(Not run)


