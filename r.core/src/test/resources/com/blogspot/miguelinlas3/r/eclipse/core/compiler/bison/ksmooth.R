### Name: ksmooth
### Title: Kernel Regression Smoother
### Aliases: ksmooth
### Keywords: smooth

### ** Examples

require(graphics)

with(cars, {
    plot(speed, dist)
    lines(ksmooth(speed, dist, "normal", bandwidth=2), col=2)
    lines(ksmooth(speed, dist, "normal", bandwidth=5), col=3)
})



