### Name: debugger
### Title: Post-Mortem Debugging
### Aliases: debugger dump.frames
### Keywords: utilities error

### ** Examples

## Not run: 
##D options(error=quote(dump.frames("testdump", TRUE)))
##D 
##D f <- function() {
##D     g <- function() stop("test dump.frames")
##D     g()
##D }
##D f()   # will generate a dump on file "testdump.rda"
##D options(error=NULL)
##D 
##D ## possibly in another R session
##D load("testdump.rda")
##D debugger(testdump)
##D Available environments had calls:
##D 1: f()
##D 2: g()
##D 3: stop("test dump.frames")
##D 
##D Enter an environment number, or 0 to exit
##D Selection: 1
##D Browsing in the environment with call:
##D f()
##D Called from: debugger.look(ind)
##D Browse[1]> ls()
##D [1] "g"
##D Browse[1]> g
##D function() stop("test dump.frames")
##D <environment: 759818>
##D Browse[1]> 
##D Available environments had calls:
##D 1: f()
##D 2: g()
##D 3: stop("test dump.frames")
##D 
##D Enter an environment number, or 0 to exit
##D Selection: 0
##D 
##D ## A possible setting for non-interactive sessions
##D options(error=quote({dump.frames(to.file=TRUE); q()}))
## End(Not run)


