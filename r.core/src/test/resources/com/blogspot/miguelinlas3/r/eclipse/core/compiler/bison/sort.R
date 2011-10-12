### Name: sort
### Title: Sorting or Ordering Vectors
### Aliases: sort sort.default sort.POSIXlt sort.int
### Keywords: univar manip arith

### ** Examples

require(stats)

x <- swiss$Education[1:25]
x; sort(x); sort(x, partial = c(10, 15))
median.default # shows you another example for 'partial'

## illustrate 'stable' sorting (of ties):
sort(c(10:3,2:12), method = "sh", index.return=TRUE) # is stable
## $x : 2  3  3  4  4  5  5  6  6  7  7  8  8  9  9 10 10 11 12
## $ix: 9  8 10  7 11  6 12  5 13  4 14  3 15  2 16  1 17 18 19
sort(c(10:3,2:12), method = "qu", index.return=TRUE) # is not
## $x : 2  3  3  4  4  5  5  6  6  7  7  8  8  9  9 10 10 11 12
## $ix: 9 10  8  7 11  6 12  5 13  4 14  3 15 16  2 17  1 18 19
##        ^^^^^

x <- c(1:3, 3:5, 10)
is.unsorted(x)                #-> FALSE: is sorted
is.unsorted(x, strictly=TRUE) #-> TRUE : is not (and cannot be) sorted strictly

## Not run: ## Small speed comparison simulation:
##D N <- 2000
##D Sim <- 20
##D rep <- 1000 # << adjust to your CPU
##D c1 <- c2 <- numeric(Sim)
##D for(is in 1:Sim){
##D   x <- rnorm(N)
##D   c1[is] <- system.time(for(i in 1:rep) sort(x, method = "shell"))[1]
##D   c2[is] <- system.time(for(i in 1:rep) sort(x, method = "quick"))[1]
##D   stopifnot(sort(x, method = "s") == sort(x, method = "q"))
##D }
##D rbind(ShellSort = c1, QuickSort = c2)
##D cat("Speedup factor of quick sort():\n")
##D summary({qq <- c1 / c2; qq[is.finite(qq)]})
##D 
##D ## A larger test
##D x <- rnorm(1e7)
##D system.time(x1 <- sort(x, method = "shell"))
##D system.time(x2 <- sort(x, method = "quick"))
##D stopifnot(identical(x1, x2))
## End(Not run)


