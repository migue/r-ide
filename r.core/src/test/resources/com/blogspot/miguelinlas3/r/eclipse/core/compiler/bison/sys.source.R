### Name: sys.source
### Title: Parse and Evaluate Expressions from a File
### Aliases: sys.source
### Keywords: file utilities

### ** Examples

## a simple way to put some objects in an environment
## high on the search path
tmp <- tempfile()
writeLines("aaa <- pi", tmp)
env <- attach(NULL, name = "myenv")
sys.source(tmp, env)
unlink(tmp)
search()
aaa
detach("myenv")



