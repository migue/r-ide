### Name: files
### Title: File and Directory Manipulation
### Aliases: files file.append file.copy file.create file.exists
###   file.remove file.rename file.symlink dir.create Sys.chmod Sys.umask
### Keywords: file

### ** Examples

cat("file A\n", file="A")
cat("file B\n", file="B")
file.append("A", "B")
file.create("A")
file.append("A", rep("B", 10))
if(interactive()) file.show("A")
file.copy("A", "C")
dir.create("tmp")
file.copy(c("A", "B"), "tmp")
list.files("tmp")
setwd("tmp")
file.remove("B")
file.symlink(file.path("..", c("A", "B")), ".")
setwd("..")
unlink("tmp", recursive=TRUE)
file.remove("A", "B", "C")



