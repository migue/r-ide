### Name: Rscript
### Title: Scripting Front-End for R
### Aliases: Rscript
### Keywords: utilities

### ** Examples
## Not run: 
##D Rscript -e 'date()' -e 'format(Sys.time(), "%a %b %d %X %Y")'
##D 
##D ## example #! script for a Unix-alike
##D 
##D #! /path/to/Rscript --vanilla --default-packages=utils
##D args <- commandArgs(TRUE)
##D res <- try(install.packages(args))
##D if(inherits(res, "try-error")) q(status=1) else q()
##D 
## End(Not run)


