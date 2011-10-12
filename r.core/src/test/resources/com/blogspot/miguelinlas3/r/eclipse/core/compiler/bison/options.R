### Name: options
### Title: Options Settings
### Aliases: options .Options getOption
### Keywords: environment error print

### ** Examples

op <- options(); utils::str(op) # op() may contain functions.

getOption("width") == options()$width # the latter needs more memory
options(digits = 15)
pi

# set the editor, and save previous value
old.o <- options(editor = "nedit")
old.o

options(check.bounds = TRUE, warn = 1)
x <- NULL; x[4] <- "yes" # gives a warning

options(digits=5)
print(1e5)
options(scipen=3); print(1e5)

options(op)     # reset (all) initial options
options("digits")

## Not run: 
##D ## set contrast handling to be like S
##D options(contrasts = c("contr.helmert", "contr.poly"))
## End(Not run)

## Not run: 
##D ## on error, terminate the R session with error status 66
##D options(error = quote(q("no", status=66, runLast=FALSE)))
##D stop("test it")
## End(Not run)

## Not run: 
##D ## Set error actions for debugging:
##D ## enter browser on error, see ?recover:
##D options(error = recover)
##D ## allows to call debugger() afterwards, see ?debugger:
##D options(error = dump.frames)
##D ## A possible setting for non-interactive sessions
##D options(error = quote({dump.frames(to.file=TRUE); q()}))
## End(Not run)


