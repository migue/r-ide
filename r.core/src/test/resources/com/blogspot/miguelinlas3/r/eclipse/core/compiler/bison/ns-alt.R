### Name: ns-alt
### Title: Experimental Alternative Name Specification Support
### Aliases: .Export .Import .ImportFrom .S3method
### Keywords: internal

### ** Examples

## Not run: 
##D ## code for package/name space 'foo'
##D x <- 1
##D f <- function(y) c(x,y)
##D print.foo <- function(x, ...) cat("<a foo>\n")
##D .Export(f)
##D S3method(print,foo)
##D 
##D ## code for package/name space 'bar'
##D .Import(foo)
##D c <- function(...) sum(...)
##D g <- function(y) f(c(y, 7))
##D h <- function(y) y+9
##D .Export(g, h)
## End(Not run)



