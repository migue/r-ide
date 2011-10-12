### Name: modifyList
### Title: Recursively Modify Elements of a List
### Aliases: modifyList
### Keywords: utilities

### ** Examples

foo <- list(a = 1, b = list(c = "a", d = FALSE))
bar <- modifyList(foo, list(e = 2, b = list(d = TRUE)))
str(foo)
str(bar)



