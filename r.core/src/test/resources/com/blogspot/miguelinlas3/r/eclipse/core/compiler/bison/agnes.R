### Name: agnes
### Title: Agglomerative Nesting (Hierarchical Clustering)
### Aliases: agnes
### Keywords: cluster

### ** Examples

data(votes.repub)
agn1 <- agnes(votes.repub, metric = "manhattan", stand = TRUE)
agn1
plot(agn1)

op <- par(mfrow=c(2,2))
agn2 <- agnes(daisy(votes.repub), diss = TRUE, method = "complete")
plot(agn2)
agnS <- agnes(votes.repub, method = "flexible", par.meth = 0.6)
plot(agnS)
par(op)

data(agriculture)
## Plot similar to Figure 7 in ref
## Not run:  plot(agnes(agriculture), ask = TRUE)
## Don't show:
plot(agnes(agriculture))
## End Don't show



