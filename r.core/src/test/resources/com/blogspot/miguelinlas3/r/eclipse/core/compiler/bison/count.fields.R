### Name: count.fields
### Title: Count the Number of Fields per Line
### Aliases: count.fields
### Keywords: file

### ** Examples

cat("NAME", "1:John", "2:Paul", file = "foo", sep = "\n")
count.fields("foo", sep = ":")
unlink("foo")



