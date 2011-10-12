### Name: order.dendrogram
### Title: Ordering or Labels of the Leaves in a Dendrogram
### Aliases: order.dendrogram labels.dendrogram
### Keywords: manip

### ** Examples

set.seed(123)
x <- rnorm(10)
hc <- hclust(dist(x))
hc$order
dd <- as.dendrogram(hc)
order.dendrogram(dd) ## the same :
stopifnot(hc$order == order.dendrogram(dd))

d2 <- as.dendrogram(hclust(dist(USArrests)))
labels(d2) ## in this case the same as
stopifnot(labels(d2) == rownames(USArrests)[order.dendrogram(d2)])



