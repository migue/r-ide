### Name: cbind2
### Title: Combine two Objects by Columns or Rows
### Aliases: cbind2 rbind2 cbind2-methods cbind2,ANY,ANY-method
###   cbind2,ANY,missing-method rbind2-methods rbind2,ANY,ANY-method
###   rbind2,ANY,missing-method
### Keywords: array manip

### ** Examples

cbind2(1:3, 4)
m <- matrix(3:8, 2,3, dimnames=list(c("a","b"), LETTERS[1:3]))
cbind2(1:2, m) # keeps dimnames from m

### Note: Use the following activation if you want cbind() to work
### ----  on S4 objects -- be careful otherwise!

methods:::bind_activation(on = TRUE)
trace("cbind2")
cbind(a=1:3)# no call to cbind2()
cbind(a=1:3, four=4, 7:9)# calling cbind2() twice
untrace("cbind2")

## Don't show: 
cbind(m,m+1,m+2)
cbind(m,a=1, ch=c("D","E"))
cbind(1,a=1:3, m) # ok with a warning
cbind(A=1, B=3, m, C=4)
## End Don't show

## The following fails currently,
## since cbind() works recursively from the tail:
try( cbind(m, a=1, b=3) )

## turn off the `special cbind()' :
methods:::bind_activation(FALSE)



