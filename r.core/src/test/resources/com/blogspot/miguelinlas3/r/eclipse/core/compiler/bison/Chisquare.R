### Name: Chisquare
### Title: The (non-central) Chi-Squared Distribution
### Aliases: Chisquare dchisq pchisq qchisq rchisq
### Keywords: distribution

### ** Examples

require(graphics)

dchisq(1, df=1:3)
pchisq(1, df= 3)
pchisq(1, df= 3, ncp = 0:4)# includes the above

x <- 1:10
## Chi-squared(df = 2) is a special exponential distribution
all.equal(dchisq(x, df=2), dexp(x, 1/2))
all.equal(pchisq(x, df=2), pexp(x, 1/2))

## non-central RNG -- df=0 with ncp > 0:  Z0 has point mass at 0!
Z0 <- rchisq(100, df = 0, ncp = 2.)
graphics::stem(Z0)

## Not run: 
##D ## visual testing
##D ## do P-P plots for 1000 points at various degrees of freedom
##D L <- 1.2; n <- 1000; pp <- ppoints(n)
##D op <- par(mfrow = c(3,3), mar= c(3,3,1,1)+.1, mgp= c(1.5,.6,0),
##D           oma = c(0,0,3,0))
##D for(df in 2^(4*rnorm(9))) {
##D   plot(pp, sort(pchisq(rr <- rchisq(n,df=df, ncp=L), df=df, ncp=L)),
##D        ylab="pchisq(rchisq(.),.)", pch=".")
##D   mtext(paste("df = ",formatC(df, digits = 4)), line= -2, adj=0.05)
##D   abline(0,1,col=2)
##D }
##D mtext(expression("P-P plots : Noncentral  "*
##D                  chi^2 *"(n=1000, df=X, ncp= 1.2)"),
##D       cex = 1.5, font = 2, outer=TRUE)
##D par(op)
## End(Not run)

## "analytical" test
lam <- seq(0,100, by=.25)
p00 <- pchisq(0,      df=0, ncp=lam)
p.0 <- pchisq(1e-300, df=0, ncp=lam)
stopifnot(all.equal(p00, exp(-lam/2)),
          all.equal(p.0, exp(-lam/2)))



