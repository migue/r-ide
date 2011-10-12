### Name: traceback
### Title: Print Call Stacks
### Aliases: traceback .Traceback
### Keywords: programming

### ** Examples

foo <- function(x) { print(1); bar(2) }
bar <- function(x) { x + a.variable.which.does.not.exist }
## Not run: 
##D foo(2) # gives a strange error
##D traceback()
## End(Not run)
## 2: bar(2)
## 1: foo(2)
bar
## Ah, this is the culprit ...



