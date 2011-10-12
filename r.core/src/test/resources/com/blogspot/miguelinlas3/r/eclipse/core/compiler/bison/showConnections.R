### Name: showConnections
### Title: Display Connections
### Aliases: showConnections getConnection getAllConnections
###   closeAllConnections stdin stdout stderr
### Keywords: connection

### ** Examples

showConnections(all = TRUE)

textConnection(letters)
# oops, I forgot to record that one
showConnections()
#  class     description      mode text   isopen   can read can write
#3 "letters" "textConnection" "r"  "text" "opened" "yes"    "no"     
## Not run: close(getConnection(3))
## Don't show: 
r <- as.numeric(row.names(showConnections()))
close(getConnection(r))
## End Don't show
showConnections()



