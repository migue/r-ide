### Name: WorldPhones
### Title: The World's Telephones
### Aliases: WorldPhones
### Keywords: datasets

### ** Examples

require(graphics)
matplot(rownames(WorldPhones), WorldPhones, type = "b", log = "y",
        xlab = "Year", ylab = "Number of telephones (1000's)")
legend(1951.5, 80000, colnames(WorldPhones), col = 1:6, lty = 1:5, 
       pch = rep(21, 7))
title(main = "World phones data: log scale for response")



