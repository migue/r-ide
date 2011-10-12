### Name: Sys.sleep
### Title: Suspend Execution for a Time Interval
### Aliases: Sys.sleep
### Keywords: utilities

### ** Examples

testit <- function(x)
{
    p1 <- proc.time()
    Sys.sleep(x)
    proc.time() - p1 # The cpu usage should be negligible
}
testit(3.7)



