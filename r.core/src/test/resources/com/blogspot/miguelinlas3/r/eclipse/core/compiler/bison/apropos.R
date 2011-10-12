### Name: apropos
### Title: Find Objects by (Partial) Name
### Aliases: apropos find
### Keywords: data documentation environment

### ** Examples

require(stats)

## Not run: apropos("lm")
apropos("GLM")                      # more than a dozen
## that may include internal objects starting '.__C__' if
## methods is attached
apropos("GLM", ignore.case = FALSE) # not one
apropos("lq")

cor <- 1:pi
find("cor")        #> ".GlobalEnv"   "package:stats"
find("cor", numeric=TRUE) # numbers with these names
find("cor", numeric=TRUE, mode="function")# only the second one
rm(cor)

## Not run: apropos(".", mode="list") # a long list

# need a DOUBLE backslash '\\' (in case you don't see it anymore)
apropos("\\[")

## Not run: # everything 
##D length(apropos("."))
##D 
##D # those starting with 'pr'
##D apropos("^pr")
##D 
##D # the 1-letter things
##D apropos("^.$")
##D # the 1-2-letter things
##D apropos("^..?$")
##D # the 2-to-4 letter things
##D apropos("^.{2,4}$")
##D 
##D # the 8-and-more letter things
##D apropos("^.{8,}$")
##D table(nchar(apropos("^.{8,}$")))
## End(Not run)


