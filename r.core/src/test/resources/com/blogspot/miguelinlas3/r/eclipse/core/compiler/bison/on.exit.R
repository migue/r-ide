### Name: on.exit
### Title: Function Exit Code
### Aliases: on.exit
### Keywords: programming

### ** Examples

require(graphics)

opar <- par(mai = c(1,1,1,1))
on.exit(par(opar))
## Don't show: 
par(opar)
## End Don't show



