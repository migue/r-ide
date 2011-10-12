### Name: recover
### Title: Browsing after an Error
### Aliases: recover limitedLabels
### Keywords: programming debugging

### ** Examples

## Not run: 
##D 
##D options(error = recover) # setting the error option
##D 
##D ### Example of interaction
##D 
##D > myFit <- lm(y ~ x, data = xy, weights = w)
##D Error in lm.wfit(x, y, w, offset = offset, ...) :
##D         missing or negative weights not allowed
##D 
##D Enter a frame number, or 0 to exit
##D 1:lm(y ~ x, data = xy, weights = w)
##D 2:lm.wfit(x, y, w, offset = offset, ...)
##D Selection: 2
##D Called from: eval(expr, envir, enclos)
##D Browse[1]> objects() # all the objects in this frame
##D [1] "method" "n"      "ny"     "offset" "tol"    "w"
##D [7] "x"      "y"
##D Browse[1]> w
##D [1] -0.5013844  1.3112515  0.2939348 -0.8983705 -0.1538642
##D [6] -0.9772989  0.7888790 -0.1919154 -0.3026882
##D Browse[1]> dump.frames() # save for offline debugging
##D Browse[1]> c # exit the browser
##D 
##D Enter a frame number, or 0 to exit
##D 1:lm(y ~ x, data = xy, weights = w)
##D 2:lm.wfit(x, y, w, offset = offset, ...)
##D Selection: 0 # exit recover
##D >
##D 
## End(Not run)



