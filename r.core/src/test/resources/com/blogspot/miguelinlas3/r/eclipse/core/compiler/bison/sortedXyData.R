### Name: sortedXyData
### Title: Create a sortedXyData object
### Aliases: sortedXyData sortedXyData.default
### Keywords: manip

### ** Examples

DNase.2 <- DNase[ DNase$Run == "2", ]
sortedXyData( expression(log(conc)), expression(density), DNase.2 )



