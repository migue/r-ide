### Name: NLSstClosestX
### Title: Inverse Interpolation
### Aliases: NLSstClosestX NLSstClosestX.sortedXyData
### Keywords: manip

### ** Examples

DNase.2 <- DNase[ DNase$Run == "2", ]
DN.srt <- sortedXyData(expression(log(conc)), expression(density), DNase.2)
NLSstClosestX(DN.srt, 1.0)



