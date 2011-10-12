### Name: cutree
### Title: Cut a tree into groups of data
### Aliases: cutree
### Keywords: multivariate cluster

### ** Examples

hc <- hclust(dist(USArrests))

cutree(hc, k=1:5)#k = 1 is trivial
cutree(hc, h=250)

## Compare the 2 and 3 grouping:
g24 <- cutree(hc, k = c(2,4))
table(g24[,"2"], g24[,"4"])



