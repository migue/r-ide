### Name: boxplot.stats
### Title: Box Plot Statistics
### Aliases: boxplot.stats
### Keywords: dplot

### ** Examples

require(stats)
x <- c(1:100, 1000)
(b1 <- boxplot.stats(x))
(b2 <- boxplot.stats(x, do.conf=FALSE, do.out=FALSE))
stopifnot(b1 $ stats == b2 $ stats) # do.out=F is still robust
boxplot.stats(x, coef = 3, do.conf=FALSE)
## no outlier treatment:
boxplot.stats(x, coef = 0)

boxplot.stats(c(x, NA)) # slight change : n is 101
(r <- boxplot.stats(c(x, -1:1/0)))
stopifnot(r$out == c(1000, -Inf, Inf))

## Don't show: 
 ## Difference between quartiles and hinges :
 nn <- 1:17 ;  n4 <- nn %% 4
 hin <- sapply(sapply(nn, seq), function(x) boxplot.stats(x)$stats[c(2,4)])
 q13 <- sapply(sapply(nn, seq), quantile, probs = c(1,3)/4, names = FALSE)
 m <- t(rbind(q13,hin))[, c(1,3,2,4)]
 dimnames(m) <- list(paste(nn), c("q1","lH", "q3","uH"))
 stopifnot(m[n4==1, 1:2] == (nn[n4==1] + 3)/4,# quart. = hinge
           m[n4==1, 3:4] == (3*nn[n4==1]+1)/4,
           m[,"lH"] == ( (nn+3) %/% 2) / 2,
           m[,"uH"] == ((3*nn+2)%/% 2) / 2)
 cm <- noquote(format(m))
 cm[m[,2] == m[,1], 2] <- " = "
 cm[m[,4] == m[,3], 4] <- " = "
 cm
## End Don't show




