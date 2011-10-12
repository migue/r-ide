### Name: dyn.load
### Title: Foreign Function Interface
### Aliases: dyn.load dyn.unload is.loaded
### Keywords: interface

### ** Examples

is.loaded("hcass2") #-> probably TRUE, as stats is loaded
is.loaded("supsmu") # Fortran entry point in stats
is.loaded("supsmu", "stats", "Fortran")
is.loaded("PDF", type = "External")



