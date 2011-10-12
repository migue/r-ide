### Name: data.matrix
### Title: Convert a Data Frame to a Numeric Matrix
### Aliases: data.matrix
### Keywords: array

### ** Examples

DF <- data.frame(a=1:3, b=letters[10:12],
                 c=seq(as.Date("2004-01-01"), by = "week", len = 3),
                 stringsAsFactors = TRUE)
data.matrix(DF[1:2])
data.matrix(DF)



