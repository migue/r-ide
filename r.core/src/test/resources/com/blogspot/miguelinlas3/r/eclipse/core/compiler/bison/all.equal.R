### Name: all.equal
### Title: Test if Two Objects are (Nearly) Equal
### Aliases: all.equal all.equal.default all.equal.numeric
###   all.equal.character all.equal.factor all.equal.formula all.equal.list
###   all.equal.language all.equal.raw attr.all.equal
### Keywords: programming utilities logic arith

### ** Examples

all.equal(pi, 355/113)
# not precise enough (default tol) > relative error

d45 <- pi*(1/4 + 1:10)
stopifnot(
all.equal(tan(d45), rep(1,10)))        # TRUE, but
all      (tan(d45) == rep(1,10))       # FALSE, since not exactly
all.equal(tan(d45), rep(1,10), tol=0)  # to see difference



