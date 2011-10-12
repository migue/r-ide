### Name: get
### Title: Return the Value of a Named Object
### Aliases: get mget
### Keywords: data

### ** Examples

get("%o%")

##test mget
e1 <- new.env()
mget(letters, e1, ifnotfound = as.list(LETTERS))



