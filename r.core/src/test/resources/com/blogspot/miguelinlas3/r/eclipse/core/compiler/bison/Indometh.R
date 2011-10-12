### Name: Indometh
### Title: Pharmacokinetics of Indomethicin
### Aliases: Indometh
### Keywords: datasets

### ** Examples

require(stats)
fm1 <- nls(conc ~ SSbiexp(time, A1, lrc1, A2, lrc2),
           data = Indometh, subset = Subject == 1)
summary(fm1)



