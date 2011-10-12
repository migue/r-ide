### Name: Tukey
### Title: The Studentized Range Distribution
### Aliases: Tukey ptukey qtukey
### Keywords: distribution

### ** Examples

if(interactive())
  curve(ptukey(x, nm=6, df=5), from=-1, to=8, n=101)
(ptt <- ptukey(0:10, 2, df= 5))
(qtt <- qtukey(.95, 2, df= 2:11))
## The precision may be not much more than about 8 digits:
summary(abs(.95 - ptukey(qtt,2, df = 2:11)))



