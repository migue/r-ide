### Name: quit
### Title: Terminate an R Session
### Aliases: quit q .Last .Last.sys
### Keywords: environment

### ** Examples

## Not run: 
##D ## Unix-flavour example
##D .Last <- function() {
##D   cat("Now sending PostScript graphics to the printer:\n")
##D   system("lpr Rplots.ps")
##D   cat("bye bye...\n")
##D }
##D quit("yes")
## End(Not run)



