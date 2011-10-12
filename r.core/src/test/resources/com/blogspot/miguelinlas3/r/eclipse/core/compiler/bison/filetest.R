### Name: file_test
### Title: Shell-style Tests on Files
### Aliases: file_test
### Keywords: file

### ** Examples

dir <- file.path(R.home(), "library", "stats")
file_test("-d", dir)
file_test("-nt", file.path(dir, "R"), file.path(dir, "demo"))



