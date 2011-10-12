### Name: dcf
### Title: Read and Write Data in DCF Format
### Aliases: read.dcf write.dcf
### Keywords: print file

### ** Examples

## Create a reduced version of the 'CONTENTS' file in package 'splines'
x <- read.dcf(file = system.file("CONTENTS", package = "splines"),
              fields = c("Entry", "Description"))
write.dcf(x)



