### Name: setOldClass
### Title: Register Old-Style (S3) Classes and Inheritance
### Aliases: setOldClass .setOldIs POSIXct-class POSIXlt-class POSIXt-class
###   aov-class maov-class anova-class anova.glm-class anova.glm.null-class
###   Date-class data.frame-class data.frameRowLabels-class density-class
###   dump.frames-class factor-class formula-class glm-class glm.null-class
###   hsearch-class integrate-class libraryIQR-class lm-class logLik-class
###   mlm-class mtable-class mts-class ordered-class packageIQR-class
###   packageInfo-class recordedplot-class rle-class socket-class
###   summary.table-class oldClass-class .OldClassesList table-class
###   initialize,data.frame-method initialize,factor-method
###   initialize,ordered-method initialize,table-method
###   initialize,summary.table-method
### Keywords: programming methods

### ** Examples


require(stats)
setOldClass(c("mlm", "lm"))
setGeneric("dfResidual", function(model)standardGeneric("dfResidual"))
setMethod("dfResidual", "lm", function(model)model$df.residual)

## dfResidual will work on mlm objects as well as lm objects
myData <- data.frame(time = 1:10, y = (1:10)^.5)
myLm <- lm(cbind(y, y^3)  ~ time, myData)

## two examples extending S3 class "lm", class "xlm"  directly and "ylm" indirectly
setClass("xlm", representation(eps = "numeric"), contains = "lm")
setClass("ylm", representation(header = "character"), contains = "xlm")
ym1 = new("ylm", myLm, header = "Example", eps = 0.)
## for more examples, see ?S3Class.

## Don't show: 
stopifnot(identical(dfResidual(myLm), myLm$df.residual))
removeClass("ylm"); removeClass("xlm")
rm(myData, myLm)
removeGeneric("dfResidual")
## End Don't show

## Examples of S3 classes with guaranteed attributes
## an S3 class "stamped" with a vector and  a "date" attribute
## Here is a generator function and an S3 print method.
## NOTE:  it's essential that the generator checks the attribute classes
stamped <- function(x, date = Sys.time()) {
    if(!inherits(date, "POSIXt"))
      stop("bad date argument")
    if(!is.vector(x))
      stop("x must be a vector")
    attr(x, "date") <- date
    class(x) <- "stamped"
    x
}

print.stamped <- function(x, ...) {
    print(as.vector(x))
    cat("Date: ",  format(attr(x,"date")), "\n")
}

## Now, an S4 class with the same structure:
setClass("stamped4", contains = "vector", representation(date = "POSIXt"))

## We can use the S4 class to register "stamped", with its attributes:
setOldClass("stamped", S4Class = "stamped4")
selectMethod("show", "stamped")
## and then remove "stamped4" to clean up
removeClass("stamped4")
## Don't show: 
set.seed(113)
## End Don't show
someLetters <- stamped(sample(letters, 10),  ISOdatetime(2008, 10, 15, 12, 0, 0))

st <- new("stamped", someLetters)  
st  # show() method prints the object's class, then calls the S3 print method.

stopifnot(identical(S3Part(st, TRUE), someLetters))

# creating the S4 object directly from its data part and slots
new("stamped", 1:10, date = ISOdatetime(1976, 5, 5, 15, 10, 0))

## Not run: 
##D ## The code in R that defines "ts" as an S4 class
##D setClass("ts", contains = "structure", 
##D       representation(tsp = "numeric"), 
##D       prototype(NA, tsp = rep(1,3))) # prototype to be a legal S3 time-series
##D ## and now registers it as an S3 class
##D     setOldClass("ts", S4Class = "ts", where = envir)
##D  
## End(Not run)

## Don't show: 
  removeClass("stamped")
  rm(someLetters, st)
## End Don't show




