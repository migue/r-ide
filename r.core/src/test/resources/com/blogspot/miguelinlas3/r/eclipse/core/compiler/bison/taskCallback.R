### Name: taskCallback
### Title: Add or remove a top-level task callback
### Aliases: addTaskCallback removeTaskCallback
### Keywords: environment

### ** Examples

 times <- function(total = 3, str="Task a") {
   ctr <- 0

   function(expr, value, ok, visible) {
    ctr <<- ctr + 1
    cat(str, ctr, "\n")
    if(ctr == total) {
      cat("handler removing itself\n")
    }
    return(ctr < total)
   }
 }

 # add the callback that will work for
 # 4 top-level tasks and then remove itself.
 n <- addTaskCallback(times(4))

 # now remove it, assuming it is still first in the list.
 removeTaskCallback(n)

## Not run: 
##D # There is no point in running this
##D # as 
##D  addTaskCallback(times(4))
##D 
##D  sum(1:10)
##D  sum(1:10)
##D  sum(1:10)
##D  sum(1:10)
##D  sum(1:10)
## End(Not run)



