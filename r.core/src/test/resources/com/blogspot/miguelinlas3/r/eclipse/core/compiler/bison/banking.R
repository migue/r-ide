### Name: banking
### Title: Banking
### Aliases: banking
### Keywords: dplot

### ** Examples


xyplot(sunspot.year ~ time(sunspot.year) | equal.count(time(sunspot.year)), 
       xlab = "", type = "l", aspect = "xy", strip = FALSE,
       scales = list(x = list(alternating = 2, relation = "sliced")),
       as.table = TRUE, main = "Yearly Sunspots")




