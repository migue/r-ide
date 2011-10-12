### Name: demo
### Title: Demonstrations of R Functionality
### Aliases: demo
### Keywords: documentation utilities

### ** Examples

demo() # for attached packages

## All available demos:
demo(package = .packages(all.available = TRUE))

demo(lm.glm, package="stats")
## Not run: 
##D  ch <- "scoping"
##D  demo(ch, character = TRUE)
## End(Not run)


