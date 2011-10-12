### Name: fractions
### Title: Rational Approximation
### Aliases: fractions Math.fractions Ops.fractions Summary.fractions
###   [.fractions [<-.fractions as.character.fractions as.fractions
###   is.fractions print.fractions t.fractions
### Keywords: math

### ** Examples

X <- matrix(runif(25), 5, 5)
solve(X, X/5)
##              [,1]        [,2]       [,3]        [,4]        [,5]
##  [1,]  2.0000e-01  3.7199e-17 1.2214e-16  5.7887e-17 -8.7841e-17
##  [2,] -1.1473e-16  2.0000e-01 7.0955e-17  2.0300e-17 -1.0566e-16
##  [3,]  2.7975e-16  1.3653e-17 2.0000e-01 -1.3397e-16  1.5577e-16
##  [4,] -2.9196e-16  2.0412e-17 1.5618e-16  2.0000e-01 -2.1921e-16
##  [5,] -3.6476e-17 -3.6430e-17 3.6432e-17  4.7690e-17  2.0000e-01

fractions(solve(X, X/5))
##      [,1] [,2] [,3] [,4] [,5]
## [1,] 1/5    0    0    0    0
## [2,]   0  1/5    0    0    0
## [3,]   0    0  1/5    0    0
## [4,]   0    0    0  1/5    0
## [5,]   0    0    0    0  1/5

fractions(solve(X, X/5)) + 1
##      [,1] [,2] [,3] [,4] [,5]
## [1,] 6/5    1    1    1    1
## [2,]   1  6/5    1    1    1
## [3,]   1    1  6/5    1    1
## [4,]   1    1    1  6/5    1
## [5,]   1    1    1    1  6/5



