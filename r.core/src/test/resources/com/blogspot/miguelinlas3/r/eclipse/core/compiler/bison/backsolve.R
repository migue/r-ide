### Name: backsolve
### Title: Solve an Upper or Lower Triangular System
### Aliases: backsolve forwardsolve
### Keywords: algebra array

### ** Examples

## upper triangular matrix 'r':
r <- rbind(c(1,2,3),
           c(0,1,1),
           c(0,0,2))
( y <- backsolve(r, x <- c(8,4,2)) ) # -1 3 1
r %*% y # == x = (8,4,2)
backsolve(r, x, transpose = TRUE) # 8 -12 -5



