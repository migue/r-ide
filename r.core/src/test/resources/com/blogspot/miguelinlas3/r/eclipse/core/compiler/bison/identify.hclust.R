### Name: identify.hclust
### Title: Identify Clusters in a Dendrogram
### Aliases: identify.hclust
### Keywords: cluster iplot

### ** Examples

## Not run: 
##D require(graphics)
##D 
##D hca <- hclust(dist(USArrests))
##D plot(hca)
##D (x <- identify(hca)) ##  Terminate with 2nd mouse button !!
##D 
##D hci <- hclust(dist(iris[,1:4]))
##D plot(hci)
##D identify(hci, function(k) print(table(iris[k,5])))
##D 
##D # open a new device (one for dendrogram, one for bars):
##D get(getOption("device"))() # << make that narrow (& small)
##D                            # and *beside* 1st one
##D nD <- dev.cur()            # to be for the barplot
##D dev.set(dev.prev())# old one for dendrogram
##D plot(hci)
##D ## select subtrees in dendrogram and "see" the species distribution:
##D identify(hci, function(k) barplot(table(iris[k,5]),col=2:4), DEV.FUN = nD)
## End(Not run)



