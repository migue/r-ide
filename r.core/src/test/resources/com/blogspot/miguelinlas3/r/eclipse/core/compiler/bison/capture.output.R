### Name: capture.output
### Title: Send output to a character string or file
### Aliases: capture.output
### Keywords: utilities

### ** Examples

require(stats)
glmout <- capture.output(example(glm))
glmout[1:5]
capture.output(1+1, 2+2)
capture.output({1+1; 2+2})
## Not run: 
##D ## on Unix with enscript available
##D ps <- pipe("enscript -o tempout.ps","w")
##D capture.output(example(glm), file=ps)
##D close(ps)
## End(Not run)



