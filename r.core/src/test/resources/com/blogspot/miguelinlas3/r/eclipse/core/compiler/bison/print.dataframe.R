### Name: print.data.frame
### Title: Printing Data Frames
### Aliases: print.data.frame
### Keywords: print

### ** Examples

(dd <- data.frame(x=1:8, f=gl(2,4), ch=I(letters[1:8])))
     # print() with defaults
print(dd, quote = TRUE, row.names = FALSE)
     # suppresses row.names and quotes all entries



