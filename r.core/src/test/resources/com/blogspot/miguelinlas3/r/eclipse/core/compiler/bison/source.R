### Name: source
### Title: Read R Code from a File or a Connection
### Aliases: source
### Keywords: file programming connection

### ** Examples

## If you want to source() a bunch of files, something like
## the following may be useful:
 sourceDir <- function(path, trace = TRUE, ...) {
    for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
       if(trace) cat(nm,":")           
       source(file.path(path, nm), ...)
       if(trace) cat("\n")
    }
 }



