### Name: coef.hclust
### Title: Agglomerative Coefficient for 'hclust' Objects
### Aliases: coef.hclust coef.twins
### Keywords: cluster

### ** Examples

data(agriculture)
aa <- agnes(agriculture)
coef(aa) # really just extracts aa$ac
coef(as.hclust(aa))# recomputes
## Don't show: 
 d.a <- dist(agriculture, "manhattan")
 for (m in c("average", "single", "complete")) 
    stopifnot(all.equal(coef(hclust(d.a, method=m)),
                        coef(agnes (d.a, method=m)), tol=1e-13))
## End Don't show



