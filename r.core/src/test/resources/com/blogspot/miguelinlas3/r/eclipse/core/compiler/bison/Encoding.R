### Encoding: latin1

### Name: Encoding
### Title: Read or Set the Declared Encodings for a Character Vector
### Aliases: Encoding Encoding<-
### Keywords: utilities character

### ** Examples

## x is intended to be in latin1
x <- "fa\xE7ile"
Encoding(x)
Encoding(x) <- "latin1"
x
xx <- iconv(x, "latin1", "UTF-8")
Encoding(c(x, xx))
c(x, xx)



