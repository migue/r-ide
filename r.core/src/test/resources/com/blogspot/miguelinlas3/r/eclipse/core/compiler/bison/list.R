### Name: list
### Title: Lists - Generic and Dotted Pairs
### Aliases: list pairlist alist as.list as.list.default as.list.data.frame
###   as.list.environment as.list.factor as.pairlist is.list is.pairlist
### Keywords: list manip

### ** Examples

require(graphics)

# create a plotting structure
pts <- list(x=cars[,1], y=cars[,2])
plot(pts)

is.pairlist(.Options)  # a user-level pairlist

## "pre-allocate" an empty list of length 5
vector("list", 5)

# Argument lists
f <- function() x
# Note the specification of a "..." argument:
formals(f) <- al <- alist(x=, y=2+3, ...=)
f
al

## environment->list coercion

e1 <- new.env()
e1$a <- 10
e1$b <- 20
as.list(e1)



