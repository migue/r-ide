### Name: autoload
### Title: On-demand Loading of Packages
### Aliases: autoload autoloader .AutoloadEnv .Autoloaded Autoloads
### Keywords: data programming

### ** Examples

require(stats)
autoload("interpSpline", "splines")
search()
ls("Autoloads")
.Autoloaded

x <- sort(stats::rnorm(12))
y <- x^2
is <- interpSpline(x,y)
search() ## now has splines
detach("package:splines")
search()
is2 <- interpSpline(x,y+x)
search() ## and again
detach("package:splines")



