### Name: plot.formula
### Title: Formula Notation for Scatterplots
### Aliases: plot.formula lines.formula points.formula
### Keywords: hplot

### ** Examples

op <- par(mfrow=c(2,1))
plot(Ozone ~ Wind, data = airquality, pch=as.character(Month))
plot(Ozone ~ Wind, data = airquality, pch=as.character(Month),
     subset = Month != 7)
par(op)



