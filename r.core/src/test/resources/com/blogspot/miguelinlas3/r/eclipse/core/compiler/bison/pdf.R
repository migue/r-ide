### Encoding: latin1

### Name: pdf
### Title: PDF Graphics Device
### Aliases: pdf
### Keywords: device

### ** Examples

## Not run: 
##D ## Test function for encodings
##D TestChars <- function(encoding="ISOLatin1", ...)
##D {
##D     pdf(encoding=encoding, ...)
##D     par(pty="s")
##D     plot(c(-1,16), c(-1,16), type="n", xlab="", ylab="",
##D          xaxs="i", yaxs="i")
##D          title(paste("Centred chars in encoding", encoding))
##D     grid(17, 17, lty=1)
##D     for(i in c(32:255)) {
##D         x <- i %% 16
##D         y <- i %/% 16
##D         points(x, y, pch=i)
##D     }
##D     dev.off()
##D }
##D ## there will be many warnings.
##D TestChars("ISOLatin2")
##D ## this does not view properly in older viewers.
##D TestChars("ISOLatin2", family="URWHelvetica")
##D ## works well for viewing in gs-based viewers, and often in xpdf.
## End(Not run)


