### Name: prompt
### Title: Produce Prototype of an R Documentation File
### Aliases: prompt prompt.default prompt.data.frame
### Keywords: documentation

### ** Examples

require(graphics)
prompt(plot.default)
prompt(interactive, force.function = TRUE)
unlink("plot.default.Rd")
unlink("interactive.Rd")

prompt(women) # data.frame
unlink("women.Rd")

prompt(sunspots) # non-data.frame data
unlink("sunspots.Rd")



