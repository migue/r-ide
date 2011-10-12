### Name: promptPackage
### Title: Generate a Shell for Documentation of a Package
### Aliases: promptPackage
### Keywords: documentation

### ** Examples

filename <- tempfile()
promptPackage("utils", filename = filename)
file.show(filename)
unlink(filename)



