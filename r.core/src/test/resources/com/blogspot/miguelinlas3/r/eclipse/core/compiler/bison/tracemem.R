### Name: tracemem
### Title: Trace Copying of Objects
### Aliases: tracemem untracemem retracemem
### Keywords: utilities

### ** Examples
## Not run: 
##D a <- 1:10
##D tracemem(a)
##D ## b and a share memory
##D b <- a
##D b[1] <- 1
##D untracemem(a)
##D 
##D ## copying in lm
##D d <- stats::rnorm(10)
##D tracemem(d)
##D lm(d ~ a+log(b))
##D 
##D ## f is not a copy and is not traced
##D f <- d[-1]
##D f+1
##D ## indicate that f should be traced as a copy of d
##D retracemem(f, retracemem(d))
##D f+1
## End(Not run)


