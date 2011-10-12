### Name: textConnection
### Title: Text Connections
### Aliases: textConnection textConnectionValue
### Keywords: file connection

### ** Examples

zz <- textConnection(LETTERS)
readLines(zz, 2)
scan(zz, "", 4)
pushBack(c("aa", "bb"), zz)
scan(zz, "", 4)
close(zz)

zz <- textConnection("foo", "w")
writeLines(c("testit1", "testit2"), zz)
cat("testit3 ", file=zz)
isIncomplete(zz)
cat("testit4\n", file=zz)
isIncomplete(zz)
close(zz)
foo

## Not run: 
##D # capture R output: use part of example from help(lm)
##D zz <- textConnection("foo", "w")
##D ctl <- c(4.17, 5.58, 5.18, 6.11, 4.5, 4.61, 5.17, 4.53, 5.33, 5.14)
##D trt <- c(4.81, 4.17, 4.41, 3.59, 5.87, 3.83, 6.03, 4.89, 4.32, 4.69)
##D group <- gl(2, 10, 20, labels = c("Ctl", "Trt"))
##D weight <- c(ctl, trt)
##D sink(zz)
##D anova(lm.D9 <- lm(weight ~ group))
##D cat("\nSummary of Residuals:\n\n")
##D summary(resid(lm.D9))
##D sink()
##D close(zz)
##D cat(foo, sep = "\n")
## End(Not run)



