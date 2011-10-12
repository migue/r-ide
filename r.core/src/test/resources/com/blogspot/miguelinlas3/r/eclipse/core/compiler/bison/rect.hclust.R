### Name: rect.hclust
### Title: Draw Rectangles Around Hierarchical Clusters
### Aliases: rect.hclust
### Keywords: aplot cluster

### ** Examples

require(graphics)

hca <- hclust(dist(USArrests))
plot(hca)
rect.hclust(hca, k=3, border="red")
x <- rect.hclust(hca, h=50, which=c(2,7), border=3:4)
x



