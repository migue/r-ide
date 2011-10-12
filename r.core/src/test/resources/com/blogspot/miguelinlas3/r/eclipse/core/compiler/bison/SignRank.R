### Name: SignRank
### Title: Distribution of the Wilcoxon Signed Rank Statistic
### Aliases: SignRank dsignrank psignrank qsignrank rsignrank
### Keywords: distribution

### ** Examples

require(graphics)

par(mfrow=c(2,2))
for(n in c(4:5,10,40)) {
  x <- seq(0, n*(n+1)/2, length=501)
  plot(x, dsignrank(x,n=n), type='l', main=paste("dsignrank(x,n=",n,")"))
}
## Don't show: 
p <- c(1, 1, 1, 2, 2:6, 8, 10, 11, 13, 15, 17, 20, 22, 24,
       27, 29, 31, 33, 35, 36, 38, 39, 39, 40)
stopifnot(round(dsignrank(0:56, n=10)* 2^10) == c(p, rev(p), 0),
          qsignrank((1:16)/ 16, n=4) == c(0:2, rep(3:7, each=2), 8:10))
## End Don't show



