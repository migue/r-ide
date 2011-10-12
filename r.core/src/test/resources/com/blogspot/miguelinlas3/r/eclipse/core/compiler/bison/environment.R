### Name: environment
### Title: Environment Access
### Aliases: environment environment<- .GlobalEnv globalenv emptyenv
###   baseenv is.environment new.env parent.env parent.env<-
###   .BaseNamespaceEnv environmentName env.profile
### Keywords: data programming

### ** Examples

f <- function() "top level function"

##-- all three give the same:
environment()
environment(f)
.GlobalEnv

ls(envir=environment(stats::approxfun(1:2,1:2, method="const")))

is.environment(.GlobalEnv) # TRUE

e1 <- new.env(parent = baseenv())  # this one has enclosure package:base.
e2 <- new.env(parent = e1)
assign("a", 3, envir=e1)
ls(e1)
ls(e2)
exists("a", envir=e2)   # this succeeds by inheritance
exists("a", envir=e2, inherits = FALSE)
exists("+", envir=e2)   # this succeeds by inheritance



