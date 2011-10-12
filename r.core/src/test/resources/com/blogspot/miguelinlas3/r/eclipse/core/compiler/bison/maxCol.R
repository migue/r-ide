### Name: maxCol
### Title: Find Maximum Position in Matrix
### Aliases: max.col
### Keywords: utilities array

### ** Examples

table(mc <- max.col(swiss))# mostly "1" and "5", 5 x "2" and once "4"
swiss[unique(print(mr <- max.col(t(swiss)))) , ] # 3 33 45 45 33 6

set.seed(1)# reproducible example:
(mm <- rbind(x = round(2*stats::runif(12)),
             y = round(5*stats::runif(12)),
             z = round(8*stats::runif(12))))
## Not run: 
##D   [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
##D x    1    1    1    2    0    2    2    1    1     0     0     0
##D y    3    2    4    2    4    5    2    4    5     1     3     1
##D z    2    3    0    3    7    3    4    5    4     1     7     5
## End(Not run)
## column indices of all row maxima :
utils::str(lapply(1:3, function(i) which(mm[i,] == max(mm[i,]))))
max.col(mm) ; max.col(mm) # "random"
max.col(mm, "first")# -> 4 6 5
max.col(mm, "last") # -> 7 9 11
## Don't show: 
stopifnot(max.col(mm, "first") == c(4, 6, 5),
          max.col(mm, "last")  == c(7, 9,11))
## End Don't show



