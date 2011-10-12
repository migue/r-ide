### Name: showNonASCII
### Title: Highlight non-ASCII characters
### Aliases: showNonASCII
### Keywords: utilities

### ** Examples

out <- c(
"fa\xE7ile test of showNonASCII():",
"\\details{",
"   This is a good line",
"   This has an \xfcmlaut in it.",
"   OK again.",
"}")
cat(out, file = "my.Rd", sep = "\n")

showNonASCII(readLines("my.Rd"))
unlink("my.Rd")



