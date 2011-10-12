### Name: recordGraphics
### Title: Record graphics operations
### Aliases: recordGraphics
### Keywords: device

### ** Examples

require(graphics)

plot(1:10)
# This rectangle remains 1inch wide when the device is resized
recordGraphics(
  {
    rect(4, 2,
         4 + diff(par("usr")[1:2])/par("pin")[1], 3)
  },
  list(),
  getNamespace("graphics"))



