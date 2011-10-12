### Name: vector
### Title: Vectors
### Aliases: vector as.vector as.vector.factor is.vector atomic
### Keywords: classes

### ** Examples

df <- data.frame(x=1:3, y=5:7)
## Not run: 
##D ## Error:
##D   as.vector(data.frame(x=1:3, y=5:7), mode="numeric")
## End(Not run)

x <- c(a = 1, b = 2)
is.vector(x)
as.vector(x)
all.equal(x, as.vector(x)) ## FALSE

###-- All the following are TRUE:
is.list(df)
! is.vector(df)
! is.vector(df, mode="list")

is.vector(list(), mode="list")
is.vector(NULL,   mode="NULL")



