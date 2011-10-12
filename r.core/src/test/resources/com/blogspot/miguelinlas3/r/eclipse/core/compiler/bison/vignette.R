### Name: vignette
### Title: View or List Vignettes
### Aliases: vignette edit.vignette print.vignette vignettes
### Keywords: documentation

### ** Examples

## List vignettes from all *attached* packages
vignette(all = FALSE)

## List vignettes from all *installed* packages (can take a long time!):
vignette(all = TRUE)

## Not run: 
##D ## Open the grid intro vignette
##D vignette("grid")
##D 
##D ## The same
##D v1 <- vignette("grid")
##D print(v1)
##D 
##D ## Now let us have a closer look at the code
##D edit(v1)
##D 
##D ## An alternative way of extracting the code,
##D ## R file is written to current working directory
##D Stangle(v1$file)
##D 
##D ## A package can have more than one vignette (package grid has several):
##D vignette(package="grid")
##D vignette("rotated")
##D ## The same, but without searching for it:
##D vignette("rotated", package="grid")
## End(Not run)



