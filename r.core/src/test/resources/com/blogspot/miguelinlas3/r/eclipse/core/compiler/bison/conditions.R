### Name: conditions
### Title: Condition Handling and Recovery
### Aliases: conditions condition computeRestarts conditionCall
###   conditionMessage findRestart invokeRestart invokeRestartInteractively
###   isRestart restartDescription restartFormals signalCondition
###   simpleCondition simpleError simpleWarning simpleMessage tryCatch
###   withCallingHandlers withRestarts .signalSimpleWarning
###   .handleSimpleError as.character.condition as.character.error
###   conditionCall.condition conditionMessage.condition print.condition
###   print.restart
### Keywords: programming error

### ** Examples

tryCatch(1, finally=print("Hello"))
e <- simpleError("test error")
## Not run: 
##D  stop(e)
##D  tryCatch(stop(e), finally=print("Hello"))
##D  tryCatch(stop("fred"), finally=print("Hello"))
## End(Not run)
tryCatch(stop(e), error = function(e) e, finally=print("Hello"))
tryCatch(stop("fred"),  error = function(e) e, finally=print("Hello"))
withCallingHandlers({ warning("A"); 1+2 }, warning = function(w) {})
## Not run: 
##D  { withRestarts(stop("A"), abort = function() {}); 1 }
## End(Not run)
withRestarts(invokeRestart("foo", 1, 2), foo = function(x, y) {x + y})



