### Name: deriv
### Title: Symbolic and Algorithmic Derivatives of Simple Expressions
### Aliases: D deriv deriv.default deriv.formula deriv3 deriv3.default
###   deriv3.formula
### Keywords: math nonlinear

### ** Examples

## formula argument :
dx2x <- deriv(~ x^2, "x") ; dx2x
## Not run: 
##D expression({
##D          .value <- x^2
##D          .grad <- array(0, c(length(.value), 1), list(NULL, c("x")))
##D          .grad[, "x"] <- 2 * x
##D          attr(.value, "gradient") <- .grad
##D          .value
##D })
## End(Not run)
mode(dx2x)
x <- -1:2
eval(dx2x)

## Something 'tougher':
trig.exp <- expression(sin(cos(x + y^2)))
( D.sc <- D(trig.exp, "x") )
all.equal(D(trig.exp[[1]], "x"), D.sc)

( dxy <- deriv(trig.exp, c("x", "y")) )
y <- 1
eval(dxy)
eval(D.sc)

## function returned:
deriv((y ~ sin(cos(x) * y)), c("x","y"), func = TRUE)

## function with defaulted arguments:
(fx <- deriv(y ~ b0 + b1 * 2^(-x/th), c("b0", "b1", "th"),
             function(b0, b1, th, x = 1:7){} ) )
fx(2,3,4)

## Higher derivatives
deriv3(y ~ b0 + b1 * 2^(-x/th), c("b0", "b1", "th"),
     c("b0", "b1", "th", "x") )

## Higher derivatives:
DD <- function(expr,name, order = 1) {
   if(order < 1) stop("'order' must be >= 1")
   if(order == 1) D(expr,name)
   else DD(D(expr, name), name, order - 1)
}
DD(expression(sin(x^2)), "x", 3)
## showing the limits of the internal "simplify()" :
## Not run: 
##D -sin(x^2) * (2 * x) * 2 + ((cos(x^2) * (2 * x) * (2 * x) + sin(x^2) *
##D     2) * (2 * x) + sin(x^2) * (2 * x) * 2)
## End(Not run)



