### Name: SweaveSyntConv
### Title: Convert Sweave Syntax
### Aliases: SweaveSyntConv
### Keywords: utilities

### ** Examples

testfile <- system.file("Sweave", "Sweave-test-1.Rnw", package = "utils")

## convert the file to latex syntax
SweaveSyntConv(testfile, SweaveSyntaxLatex)

## and run it through Sweave
Sweave("Sweave-test-1.Stex")

## Don't show: 
if(!interactive()) unlink("Sweave-test-1*")
## End Don't show



