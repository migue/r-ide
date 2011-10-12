### Name: supsmu
### Title: Friedman's SuperSmoother
### Aliases: supsmu
### Keywords: smooth

### ** Examples

require(graphics)

with(cars, {
    plot(speed, dist)
    lines(supsmu(speed, dist))
    lines(supsmu(speed, dist, bass = 7), lty = 2)
    })



