### Name: fileutils
### Title: File Utilities
### Aliases: file_path_as_absolute file_path_sans_ext list_files_with_exts
###   list_files_with_type
### Keywords: file

### ** Examples

dir <- file.path(R.home(), "library", "stats")
list_files_with_exts(file.path(dir, "demo"), "R")
list_files_with_type(file.path(dir, "demo"), "demo") # the same
file_path_sans_ext(list.files(file.path(R.home(), "modules")))



