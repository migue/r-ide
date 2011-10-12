### Name: dump
### Title: Text Representations of R Objects
### Aliases: dump
### Keywords: file connection

### ** Examples

x <- 1; y <- 1:10
dump(ls(pattern = '^[xyz]'), "xyz.Rdmped")
print(.Last.value)
unlink("xyz.Rdmped")



