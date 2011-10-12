### Name: PlantGrowth
### Title: Results from an Experiment on Plant Growth
### Aliases: PlantGrowth
### Keywords: datasets

### ** Examples

## One factor ANOVA example from Dobson's book, cf. Table 7.4:
require(stats); require(graphics)
boxplot(weight ~ group, data = PlantGrowth, main = "PlantGrowth data",
        ylab = "Dried weight of plants", col = "lightgray",
        notch = TRUE, varwidth = TRUE)
anova(lm(weight ~ group, data = PlantGrowth))



