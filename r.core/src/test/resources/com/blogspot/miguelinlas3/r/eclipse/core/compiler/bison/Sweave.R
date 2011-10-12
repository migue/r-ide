### Encoding: latin1

### Name: Sweave
### Title: Automatic Generation of Reports
### Aliases: Sweave Stangle SweaveSyntaxLatex SweaveSyntaxNoweb
### Keywords: utilities

### ** Examples

testfile <- system.file("Sweave", "Sweave-test-1.Rnw", package = "utils")

## enforce par(ask=FALSE)
options(device.ask.default=FALSE)

## create a LaTeX file
Sweave(testfile)

## This can be compiled to PDF by
## Not run: tools::texi2dvi("Sweave-test-1.tex", pdf=TRUE)
## or outside R by
## R CMD texi2dvi Sweave-test-1.tex
## which sets the appropriate TEXINPUTS path.

## create an S source file from the code chunks
Stangle(testfile)
## which can be sourced, e.g.
source("Sweave-test-1.R")

## Don't show: 
if(!interactive()) unlink("Sweave-test-1*")
## End Don't show



