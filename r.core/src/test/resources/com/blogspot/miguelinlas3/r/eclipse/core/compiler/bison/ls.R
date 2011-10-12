### Name: ls
### Title: List Objects
### Aliases: ls objects
### Keywords: environment

### ** Examples

.Ob <- 1
ls(pattern = "O")
ls(pattern= " O", all.names = TRUE)    # also shows ".[foo]"

# shows an empty list because inside myfunc no variables are defined
myfunc <- function() {ls()}
myfunc()

# define a local variable inside myfunc
myfunc <- function() {y <- 1; ls()}
myfunc()                # shows "y"



