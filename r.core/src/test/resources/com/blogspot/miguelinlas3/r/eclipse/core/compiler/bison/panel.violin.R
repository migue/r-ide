### Name: panel.violin
### Title: Panel Function to create Violin Plots
### Aliases: panel.violin
### Keywords: dplot

### ** Examples


bwplot(voice.part ~ height, singer,
       panel = function(..., box.ratio) {
           panel.violin(..., col = "transparent",
                        varwidth = FALSE, box.ratio = box.ratio)
           panel.bwplot(..., fill = NULL, box.ratio = .1)
       } )




