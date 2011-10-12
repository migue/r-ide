### Name: parse
### Title: Parse Expressions
### Aliases: parse
### Keywords: file programming connection

### ** Examples

cat("x <- c(1,4)\n  x ^ 3 -10 ; outer(1:7,5:9)\n", file="xyz.Rdmped")
# parse 3 statements from the file "xyz.Rdmped"
parse(file = "xyz.Rdmped", n = 3)
unlink("xyz.Rdmped")



