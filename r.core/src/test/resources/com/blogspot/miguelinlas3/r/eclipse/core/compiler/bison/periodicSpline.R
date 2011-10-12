### Name: periodicSpline
### Title: Create a Periodic Interpolation Spline
### Aliases: periodicSpline
### Keywords: models

### ** Examples

require(graphics); require(stats)
xx <- seq( -pi, pi, length.out = 16 )[-1]
yy <- sin( xx )
frm <- data.frame( xx, yy )
( pispl <- periodicSpline( xx, yy, period = 2 * pi ) )
pispl2 <- periodicSpline( yy ~ xx, frm, period = 2 * pi )
stopifnot(all.equal(pispl, pispl2))# pispl and pispl2 are the same

plot( pispl )          # displays over one period
points( yy ~ xx, col = "brown")
plot( predict( pispl, seq(-3*pi, 3*pi, length.out = 101) ), type = "l" )



