### Name: profile.nls
### Title: Method for Profiling nls Objects
### Aliases: profile.nls
### Keywords: nonlinear regression models

### ** Examples

# obtain the fitted object
fm1 <- nls(demand ~ SSasympOrig(Time, A, lrc), data = BOD)
# get the profile for the fitted model: default level is too extreme
pr1 <- profile(fm1, alpha = 0.05)
# profiled values for the two parameters
pr1$A
pr1$lrc
# see also example(plot.profile.nls)



