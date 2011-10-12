### Name: assign
### Title: Assign a Value to a Name
### Aliases: assign
### Keywords: data

### ** Examples

for(i in 1:6) { #-- Create objects  'r.1', 'r.2', ... 'r.6' --
 nam <- paste("r",i, sep=".")
 assign(nam, 1:i)
}
ls(pattern = "^r..$")

##-- Global assignment within a function:
myf <- function(x) {
 innerf <- function(x) assign("Global.res", x^2, envir = .GlobalEnv)
 innerf(x+1)
}
myf(3)
Global.res # 16

a <- 1:4
assign("a[1]", 2)
a[1] == 2          #FALSE
get("a[1]") == 2   #TRUE




