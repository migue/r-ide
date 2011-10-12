### Name: UKLungDeaths
### Title: Monthly Deaths from Lung Diseases in the UK
### Aliases: UKLungDeaths ldeaths fdeaths mdeaths
### Keywords: datasets

### ** Examples

require(stats); require(graphics) # for time
plot(ldeaths) 
plot(mdeaths, fdeaths) 
## Better labels:
yr <- floor(tt <- time(mdeaths))
plot(mdeaths, fdeaths,
     xy.labels = paste(month.abb[12*(tt - yr)], yr-1900, sep="'"))



