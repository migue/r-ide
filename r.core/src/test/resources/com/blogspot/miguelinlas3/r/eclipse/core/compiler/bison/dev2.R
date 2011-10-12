### Name: dev2
### Title: Copy Graphics Between Multiple Devices
### Aliases: dev.copy dev.print dev.copy2eps dev.copy2pdf dev.control
### Keywords: device

### ** Examples

## Not run: 
##D x11()
##D plot(rnorm(10), main="Plot 1")
##D dev.copy(device=x11)
##D mtext("Copy 1", 3)
##D dev.print(width=6, height=6, horizontal=FALSE) # prints it
##D dev.off(dev.prev())
##D dev.off()
## End(Not run)



