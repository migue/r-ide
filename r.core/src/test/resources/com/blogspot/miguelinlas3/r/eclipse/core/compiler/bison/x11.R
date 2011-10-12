### Name: x11
### Title: X Window System Graphics
### Aliases: x11 X11 X11.options
### Keywords: device

### ** Examples
## Not run: 
##D ## put something this is your .Rprofile to customize the defaults
##D setHook(packageEvent("grDevices", "onLoad"),
##D         function(...) grDevices::X11.options(width=8, height=6, xpos=0,
##D                                              pointsize=10))
## End(Not run)


