### Name: edit
### Title: Invoke a Text Editor
### Aliases: edit edit.default vi emacs pico xemacs xedit
### Keywords: utilities

### ** Examples

## Not run: 
##D # use xedit on the function mean and assign the changes
##D mean <- edit(mean, editor = "xedit")
##D 
##D # use vi on mean and write the result to file mean.out
##D vi(mean, file = "mean.out")
## End(Not run)



