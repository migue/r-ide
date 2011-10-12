### Name: splom
### Title: Scatter Plot Matrices
### Aliases: splom parallel splom.matrix splom.data.frame parallel.matrix
###   parallel.data.frame splom.formula parallel.formula
### Keywords: hplot

### ** Examples

super.sym <- trellis.par.get("superpose.symbol")
splom(~iris[1:4], groups = Species, data = iris,
      panel = panel.superpose,
      key = list(title = "Three Varieties of Iris",
                 columns = 3, 
                 points = list(pch = super.sym$pch[1:3],
                 col = super.sym$col[1:3]),
                 text = list(c("Setosa", "Versicolor", "Virginica"))))
splom(~iris[1:3]|Species, data = iris, 
      layout=c(2,2), pscales = 0,
      varnames = c("Sepal\nLength", "Sepal\nWidth", "Petal\nLength"),
      page = function(...) {
          ltext(x = seq(.6, .8, len = 4), 
                y = seq(.9, .6, len = 4), 
                lab = c("Three", "Varieties", "of", "Iris"),
                cex = 2)
      })
parallel(~iris[1:4] | Species, iris) 
parallel(~iris[1:4], iris, groups = Species,
         horizontal.axis = FALSE, scales = list(x = list(rot = 90)))



