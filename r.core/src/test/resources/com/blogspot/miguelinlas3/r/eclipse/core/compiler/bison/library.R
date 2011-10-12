### Name: library
### Title: Loading and Listing of Packages
### Aliases: library require .First.lib .Last.lib .noGenerics
###   print.libraryIQR print.packageInfo
### Keywords: data

### ** Examples

library()                   # list all available packages
library(lib.loc = .Library) # list all packages in the default library
library(help = splines)     # documentation on package 'splines'
library(splines)            # load package 'splines'
require(splines)            # the same
search()                    # "splines", too
detach("package:splines")

# if the package name is in a character vector, use
pkg <- "splines"
library(pkg, character.only = TRUE)
detach(pos = match(paste("package", pkg, sep=":"), search()))

require(pkg, character.only = TRUE)
detach(pos = match(paste("package", pkg, sep=":"), search()))

require(nonexistent)        # FALSE
## Not run: 
##D ## Suppose a package needs to call a DLL named 'fooEXT',
##D ## where 'EXT' is the system-specific extension.  Then you should use
##D .First.lib <- function(lib, pkg)
##D   library.dynam("foo", pkg, lib)
##D 
##D ## if you want to mask as little as possible, use
##D library(mypkg, pos = "package:base")
## End(Not run)


