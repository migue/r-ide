### Name: which.min
### Title: Where is the Min() or Max() ?
### Aliases: which.min which.max
### Keywords: utilities

### ** Examples

x <- c(1:4,0:5,11)
which.min(x)
which.max(x)

## it *does* work with NA's present, by discarding them:
presidents[1:30]
range(presidents, na.rm = TRUE)
which.min(presidents) # 28
which.max(presidents) #  2



