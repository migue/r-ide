### Name: rawConversion
### Title: Convert to or from Raw Vectors
### Aliases: charToRaw rawToChar rawShift rawToBits intToBits packBits
### Keywords: classes

### ** Examples

x <- "A test string"
(y <- charToRaw(x))
is.vector(y) # TRUE

rawToChar(y)
rawToChar(y, multiple = TRUE)
(xx <- c(y, as.raw(0), charToRaw("more")))
rawToChar(xx)
xxx <- xx
xxx[length(y)+1] <- charToRaw("&")
xxx
rawToChar(xxx)

rawShift(y, 1)
rawShift(y, -2)

rawToBits(y)



