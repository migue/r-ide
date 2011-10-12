### Name: Titanic
### Title: Survival of passengers on the Titanic
### Aliases: Titanic
### Keywords: datasets

### ** Examples

require(graphics)
mosaicplot(Titanic, main = "Survival on the Titanic")
## Higher survival rates in children?
apply(Titanic, c(3, 4), sum)
## Higher survival rates in females?
apply(Titanic, c(2, 4), sum)
## Use loglm() in package 'MASS' for further analysis ...



