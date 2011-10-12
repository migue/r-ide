### Name: ChickWeight
### Title: Weight versus age of chicks on different diets
### Aliases: ChickWeight
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
coplot(weight ~ Time | Chick, data = ChickWeight,
    type = "b", show.given = FALSE)
## fit a representative chick
fm1 <- nls(weight ~ SSlogis( Time, Asym, xmid, scal ),
    data = ChickWeight, subset = Chick == 1)
summary( fm1 )



