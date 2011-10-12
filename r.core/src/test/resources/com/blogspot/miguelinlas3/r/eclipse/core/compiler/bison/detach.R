### Name: detach
### Title: Detach Objects from the Search Path
### Aliases: detach
### Keywords: data

### ** Examples

require(splines) # package
detach(package:splines)
## could equally well use detach("package:splines")
## but NOT  pkg <- "package:splines"; detach(pkg)
## Instead, use
library(splines)
pkg <- "package:splines"
detach(pos = match(pkg, search()))

## careful: do not do this unless 'splines' is not already loaded.
library(splines)
detach(2) # 'pos' used for 'name'

## an example of the name argument to attach
## and of detaching a database named by a character vector
attach_and_detach <- function(db, pos=2)
{
   name <- deparse(substitute(db))
   attach(db, pos=pos, name=name)
   print(search()[pos])
   eval(substitute(detach(n), list(n=name)))
}
attach_and_detach(women, pos=3)

## Not run: 
##D ## Using a versioned install
##D library(ash, version="1.0-9")  # or perhaps just library(ash)
##D # then one of
##D detach("package:ash", version="1.0-9")
##D # or
##D detach("package:ash_1.0-9")
## End(Not run)


