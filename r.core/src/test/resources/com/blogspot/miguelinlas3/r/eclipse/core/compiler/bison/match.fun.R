### Name: match.fun
### Title: Function Verification for ``Function Variables''
### Aliases: match.fun
### Keywords: programming

### ** Examples

# Same as get("*"):
match.fun("*")
# Overwrite outer with a vector
outer <- 1:5
## Not run: 
##D match.fun(outer, descend = FALSE) #-> Error:  not a function
## End(Not run)
match.fun(outer) # finds it anyway
is.function(match.fun("outer")) # as well



