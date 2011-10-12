### Name: pairwise.wilcox.test
### Title: Pairwise Wilcoxon rank sum tests
### Aliases: pairwise.wilcox.test
### Keywords: htest

### ** Examples

attach(airquality)
Month <- factor(Month, labels = month.abb[5:9])
## These give warnings because of ties :
pairwise.wilcox.test(Ozone, Month)
pairwise.wilcox.test(Ozone, Month, p.adj = "bonf")
detach()



