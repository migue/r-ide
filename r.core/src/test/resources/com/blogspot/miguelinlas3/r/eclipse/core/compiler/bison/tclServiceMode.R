### Name: tclServiceMode
### Title: Allow Tcl events to be serviced or not
### Aliases: tclServiceMode
### Keywords: misc

### ** Examples

## see demo(tkcanvas) for an example
## Not run: 
##D     
##D     oldmode <- tclServiceMode(FALSE)
##D     # Do some work to create a nice picture.  Nothing will be displayed until...
##D     tclServiceMode(oldmode)
## End(Not run)
## another idea is to use tkwm.withdraw() ... tkwm.deiconify()



