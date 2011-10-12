### Name: Paren
### Title: Parentheses and Braces
### Aliases: Paren (
### Keywords: programming

### ** Examples

f <- get("(")
e <- expression(3 + 2 * 4)
identical(f(e), e)

do <- get("{")
do(x <- 3, y <- 2*x-3, 6-x-y); x; y

## note the differences
(2+3)
{2+3; 4+5}
(invisible(2+3))
{invisible(2+3)}



