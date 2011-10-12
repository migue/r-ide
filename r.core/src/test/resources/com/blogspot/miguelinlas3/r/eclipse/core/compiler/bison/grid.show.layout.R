### Name: grid.show.layout
### Title: Draw a Diagram of a Grid Layout
### Aliases: grid.show.layout
### Keywords: dplot

### ** Examples

## Diagram of a simple layout 
grid.show.layout(grid.layout(4,2,
                     heights=unit(rep(1, 4),
                                  c("lines", "lines", "lines", "null")),
                     widths=unit(c(1, 1), "inches")))



