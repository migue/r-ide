### Name: taskCallbackNames
### Title: Query the names of the current internal top-level task callbacks
### Aliases: getTaskCallbackNames
### Keywords: environment

### ** Examples

 n <- addTaskCallback(function(expr, value, ok, visible) {
                        cat("In handler\n")
                        return(TRUE)
                      }, name = "simpleHandler")

 getTaskCallbackNames()

   # now remove it by name
 removeTaskCallback("simpleHandler")

 h <- taskCallbackManager()
 h$add(function(expr, value, ok, visible) {
                        cat("In handler\n")
                        return(TRUE)
                      }, name = "simpleHandler")
 getTaskCallbackNames()
 removeTaskCallback("R-taskCallbackManager")



