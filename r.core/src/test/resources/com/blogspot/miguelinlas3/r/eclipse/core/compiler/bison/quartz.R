### Name: quartz
### Title: MacOS X Quartz Device
### Aliases: quartz quartz.options
### Keywords: device

### ** Examples
## Not run: 
##D ## put something this is your .Rprofile to customize the defaults
##D setHook(packageEvent("grDevices", "onLoad"),
##D         function(...) grDevices::quartz.options(width=8, height=6,
##D                                                 pointsize=10))
## End(Not run)


