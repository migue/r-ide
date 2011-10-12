### Name: grid.grab
### Title: Grab the current grid output
### Aliases: grid.grab grid.grabExpr
### Keywords: dplot

### ** Examples

pushViewport(viewport(w=.5, h=.5))
grid.rect()
grid.points(stats::runif(10), stats::runif(10))
popViewport()
grab <- grid.grab()
grid.newpage()
grid.draw(grab)



