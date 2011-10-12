### Name: ps.options
### Title: Auxiliary Function to Set/View Defaults for Arguments of
###   postscript
### Aliases: ps.options setEPS setPS
### Keywords: device

### ** Examples

ps.options(bg = "pink")
utils::str(ps.options())

### ---- error checking of arguments: ----
ps.options(width=0:12, onefile=0, bg=pi)
# override the check for 'width', but not 'bg':
ps.options(width=0:12, bg=pi, override.check = c(TRUE,FALSE))
utils::str(ps.options())
ps.options(reset = TRUE) # back to factory-fresh



