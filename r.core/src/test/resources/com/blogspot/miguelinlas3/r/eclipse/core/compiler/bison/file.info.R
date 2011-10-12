### Name: file.info
### Title: Extract File Information
### Aliases: file.info
### Keywords: file

### ** Examples

ncol(finf <- file.info(dir()))# at least six
## Not run: finf # the whole list
## Those that are more than 100 days old :
finf[difftime(Sys.time(), finf[,"mtime"], units="days") > 100 , 1:4]

file.info("no-such-file-exists")



