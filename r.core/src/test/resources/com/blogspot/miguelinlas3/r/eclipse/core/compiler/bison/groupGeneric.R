### Name: groupGeneric
### Title: S3 Group Generic Functions
### Aliases: S3groupGeneric .Group Math Math.data.frame Ops Ops.data.frame
###   Summary Summary.data.frame Complex 'group generic'
### Keywords: methods

### ** Examples

require(utils)

d.fr <- data.frame(x=1:9, y=stats::rnorm(9))
class(1 + d.fr) == "data.frame" ##-- add to d.f. ...

methods("Math")
methods("Ops")
methods("Summary")
methods("Complex")  # none in base R



