### Name: noquote
### Title: Class for ``no quote'' Printing of Character Strings
### Aliases: noquote print.noquote as.matrix.noquote c.noquote [.noquote
### Keywords: print methods utilities

### ** Examples

letters
nql <- noquote(letters)
nql
nql[1:4] <- "oh"
nql[1:12]

cmp.logical <- function(log.v)
{
  ## Purpose: compact printing of logicals
  log.v <- as.logical(log.v)
  noquote(if(length(log.v)==0)"()" else c(".","|")[1+log.v])
}
cmp.logical(stats::runif(20) > 0.8)



