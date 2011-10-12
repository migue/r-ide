### Name: installFoundDepends
### Title: A function to install unresolved dependencies
### Aliases: installFoundDepends
### Keywords: utilities

### ** Examples

## Set up a temporary directory to install packages to
tmp <- tempfile()
dir.create(tmp)

pDL <- pkgDepends("tools",local=FALSE)
installFoundDepends(pDL$Found, destdir=tmp)



