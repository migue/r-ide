### Name: class
### Title: Object Classes
### Aliases: class class<- oldClass oldClass<- unclass inherits
### Keywords: methods classes

### ** Examples

x <- 10
class(x) # "numeric"
oldClass(x) # NULL
inherits(x, "a") #FALSE
class(x) <- c("a", "b")
inherits(x,"a") #TRUE
inherits(x, "a", TRUE) # 1
inherits(x, c("a", "b", "c"), TRUE) # 1 2 0



