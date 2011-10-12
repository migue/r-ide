### Name: read.socket
### Title: Read from or Write to a Socket
### Aliases: read.socket write.socket
### Keywords: misc

### ** Examples

finger <- function(user, host = "localhost", port = 79, print = TRUE)
{
    if (!is.character(user))
        stop("user name must be a string")
    user <- paste(user,"\r\n")
    socket <- make.socket(host, port)
    on.exit(close.socket(socket))
    write.socket(socket, user)
    output <- character(0)
    repeat{
        ss <- read.socket(socket)
        if (ss == "") break
        output <- paste(output, ss)
    }
    close.socket(socket)
    if (print) cat(output)
    invisible(output)
}
## Not run: 
##D finger("root")  ## only works if your site provides a finger daemon
## End(Not run)



