### Name: Startup
### Title: Initialization at Start of an R Session
### Aliases: Startup Rprofile .Rprofile Rprofile.site Renviron
###   Renviron.site .Renviron .First .First.sys .OptRequireMethods
###   R_DEFAULT_PACKAGES R_ENVIRON R_ENVIRON_USER R_PROFILE R_PROFILE_USER
### Keywords: environment

### ** Examples

## Not run: 
##D ## Example ~/.Renviron on Unix
##D R_LIBS=~/R/library
##D PAGER=/usr/local/bin/less
##D 
##D ## Example .Renviron on Windows
##D R_LIBS=C:/R/library
##D MY_TCLTK="c:/Program Files/Tcl/bin"
##D 
##D ## Example of setting R_DEFAULT_PACKAGES (from R CMD check)
##D R_DEFAULT_PACKAGES='utils,grDevices,graphics,stats'
##D # this loads the packages in the order given, so they appear on
##D # the search path in reverse order.
##D 
##D ## Example of .Rprofile
##D options(width=65, digits=5)
##D options(show.signif.stars=FALSE)
##D setHook(packageEvent("grDevices", "onLoad"),
##D         function(...) grDevices::ps.options(horizontal=FALSE))
##D set.seed(1234)
##D .First <- function() cat("\n   Welcome to R!\n\n")
##D .Last <- function()  cat("\n   Goodbye!\n\n")
##D 
##D ## Example of Rprofile.site
##D local({
##D   # add MASS to the default packages, set a CRAN mirror
##D   old <- getOption("defaultPackages"); r <- getOption("repos")
##D   r["CRAN"] <- "http://my.local.cran"
##D   options(defaultPackages = c(old, "MASS"), repos = r)
##D })
##D 
##D ## if .Renviron contains
##D FOOBAR="coo\bar"doh\ex"abc\"def'"
##D 
##D ## then we get
##D > cat(Sys.getenv("FOOBAR"), "\n")
##D coo\bardoh\exabc"def'
## End(Not run)


