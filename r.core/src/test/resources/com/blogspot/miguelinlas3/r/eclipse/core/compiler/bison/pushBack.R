### Name: pushBack
### Title: Push Text Back on to a Connection
### Aliases: pushBack pushBackLength
### Keywords: connection

### ** Examples

zz <- textConnection(LETTERS)
readLines(zz, 2)
pushBack(c("aa", "bb"), zz)
pushBackLength(zz)
readLines(zz, 1)
pushBackLength(zz)
readLines(zz, 1)
readLines(zz, 1)
close(zz)



