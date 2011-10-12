### Name: package.skeleton
### Title: Create a Skeleton for a New Source Package
### Aliases: package.skeleton
### Keywords: file utilities

### ** Examples

require(stats)
## two functions and two "data sets" :
f <- function(x,y) x+y
g <- function(x,y) x-y
d <- data.frame(a=1, b=2)
e <- rnorm(1000)
## Don't show: 
  owd <- getwd()
  setwd(tempdir())
## End Don't show
package.skeleton(list=c("f","g","d","e"), name="mypkg")
## Don't show: 
 setwd(owd) 
## End Don't show



