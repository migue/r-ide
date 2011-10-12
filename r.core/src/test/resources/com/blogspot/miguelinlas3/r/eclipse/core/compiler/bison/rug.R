### Name: rug
### Title: Add a Rug to a Plot
### Aliases: rug
### Keywords: aplot

### ** Examples

require(stats)# both 'density' and its default method
with(faithful, {
    plot(density(eruptions, bw = 0.15))
    rug(eruptions)
    rug(jitter(eruptions, amount = 0.01), side = 3, col = "light blue")
})



