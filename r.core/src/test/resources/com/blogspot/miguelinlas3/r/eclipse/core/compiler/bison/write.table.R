### Name: write.table
### Title: Data Output
### Aliases: write.table write.csv write.csv2
### Keywords: print file

### ** Examples

## Not run: 
##D ## To write a CSV file for input to Excel one might use
##D x <- data.frame(a = I("a \" quote"), b = pi)
##D write.table(x, file = "foo.csv", sep = ",", col.names = NA,
##D             qmethod = "double")
##D ## and to read this file back into R one needs
##D read.table("foo.csv", header = TRUE, sep = ",", row.names = 1)
##D ## NB: you do need to specify a separator if qmethod = "double".
##D 
##D ### Alternatively
##D write.csv(x, file = "foo.csv")
##D read.csv("foo.csv", row.names = 1)
##D ## or without row names
##D write.csv(x, file = "foo.csv", row.names = FALSE)
##D read.csv("foo.csv")
## End(Not run)


