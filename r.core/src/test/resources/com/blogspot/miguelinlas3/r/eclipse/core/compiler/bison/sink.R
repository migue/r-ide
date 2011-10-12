### Name: sink
### Title: Send R Output to a File
### Aliases: sink sink.number
### Keywords: file connection

### ** Examples

sink("sink-examp.txt")
i <- 1:10
outer(i, i, "*")
sink()
unlink("sink-examp.txt")
## Not run: 
##D ## capture all the output to a file.
##D zz <- file("all.Rout", open="wt")
##D sink(zz)
##D sink(zz, type="message")
##D try(log("a"))
##D ## back to the console
##D sink(type="message")
##D sink()
##D try(log("a"))
## End(Not run)


