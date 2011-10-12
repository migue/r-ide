### Name: tkProgressBar
### Title: Progress Bars via Tk
### Aliases: tkProgressBar getTkProgressBar setTkProgressBar
###   close.tkProgressBar
### Keywords: utilities

### ** Examples
## No test: 
pb <- tkProgressBar("test progress bar", "Some information in %",
                    0, 100, 50)
Sys.sleep(0.5)
u <- c(0, sort(runif(20, 0 ,100)), 100)
for(i in u) {
    Sys.sleep(0.1)
    info <- sprintf("%d%% done", round(i))
    setTkProgressBar(pb, i, sprintf("test (%s)", info), info)
}
Sys.sleep(5)
close(pb)
## End(No test)


