### Name: attach
### Title: Attach Set of R Objects to Search Path
### Aliases: attach
### Keywords: data

### ** Examples

require(utils)

summary(women$height)   # refers to variable 'height' in the data frame
attach(women)
summary(height)         # The same variable now available by name
height <- height*2.54   # Don't do this. It creates a new variable
                        # in the user's workspace
find("height")
summary(height)         # The new variable in the workspace
rm(height)
summary(height)         # The original variable.
height <<- height*25.4  # Change the copy in the attached environment
find("height")
summary(height)         # The changed copy
detach("women")
summary(women$height)   # unchanged

## Not run: 
##D ## create an environment on the search path and populate it
##D sys.source("myfuns.R", envir=attach(NULL, name="myfuns"))
## End(Not run)


