### Name: dev.xxx
### Title: Control Multiple Devices
### Aliases: dev.cur dev.list dev.next dev.prev dev.off dev.set dev.new
###   graphics.off
### Keywords: device iplot

### ** Examples

## Not run: 
##D ## Unix-specific example
##D x11()
##D plot(1:10)
##D x11()
##D plot(rnorm(10))
##D dev.set(dev.prev())
##D abline(0,1)# through the 1:10 points
##D dev.set(dev.next())
##D abline(h=0, col="gray")# for the residual plot
##D dev.set(dev.prev())
##D dev.off(); dev.off()#- close the two X devices
## End(Not run)



