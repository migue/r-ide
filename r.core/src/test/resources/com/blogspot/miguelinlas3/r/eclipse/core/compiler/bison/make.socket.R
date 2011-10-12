### Name: make.socket
### Title: Create a Socket Connection
### Aliases: make.socket print.socket
### Keywords: misc

### ** Examples

daytime <- function(host = "localhost"){
    a <- make.socket(host, 13)
    on.exit(close.socket(a))
    read.socket(a)
}
## Official time (UTC) from US Naval Observatory
## Not run: daytime("tick.usno.navy.mil")



