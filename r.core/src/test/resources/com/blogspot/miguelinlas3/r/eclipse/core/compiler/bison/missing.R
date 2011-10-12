### Name: missing
### Title: Does a Formal Argument have a Value?
### Aliases: missing
### Keywords: programming

### ** Examples

myplot <- function(x,y) {
                if(missing(y)) {
                        y <- x
                        x <- 1:length(y)
                }
                plot(x,y)
        }



