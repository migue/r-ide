### Name: nlsList
### Title: List of nls Objects with a Common Model
### Aliases: nlsList nlsList.formula update.nlsList
### Keywords: models

### ** Examples

fm1 <- nlsList(uptake ~ SSasympOff(conc, Asym, lrc, c0),
   data = CO2, start = c(Asym = 30, lrc = -4.5, c0 = 52))
summary(fm1)



