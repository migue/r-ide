### Name: attrassign
### Title: Create new-style "assign" attribute
### Aliases: attrassign.default attrassign attrassign.lm
### Keywords: models

### ** Examples

formula<-Surv(time,status)~factor(edtrt)
tt<-terms(formula)
mf<-model.frame(tt,data=pbc)
mm<-model.matrix(tt,mf)
## a few rows of data
mm[1:3,]
## old-style assign attribute
attr(mm,"assign")
## new-style assign attribute
attrassign(mm,tt)



