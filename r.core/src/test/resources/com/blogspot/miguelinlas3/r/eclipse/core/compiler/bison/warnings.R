### Name: warnings
### Title: Print Warning Messages
### Aliases: warnings last.warning print.warnings
### Keywords: programming error

### ** Examples

## NB this example is intended to be pasted in,
##    rather than run by example()
ow <- options("warn")
for(w in -1:1) {
   options(warn = w); cat("\n warn =",w,"\n")
   for(i in 1:3) { cat(i,"..\n"); m <- matrix(1:7, 3,4) }
}
warnings()
options(ow) # reset



