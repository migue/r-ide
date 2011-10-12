### Name: withVisible
### Title: Return both a value and its visibility
### Aliases: withVisible
### Keywords: programming

### ** Examples

x <- 1
withVisible(x <- 1)
x
withVisible(x)

# Wrap the call in evalq() for special handling

df <- data.frame(a=1:5, b=1:5)
evalq(withVisible(a + b), envir=df)



