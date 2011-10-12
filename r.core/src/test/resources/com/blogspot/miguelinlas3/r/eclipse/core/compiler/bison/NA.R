### Name: NA
### Title: Not Available / ``Missing'' Values
### Aliases: NA NA_integer_ NA_real_ NA_complex_ NA_character_ is.na
###   is.na.data.frame is.na<- is.na<-.default
### Keywords: NA logic manip

### ** Examples

is.na(c(1, NA))        #> FALSE  TRUE
is.na(paste(c(1, NA))) #> FALSE FALSE

(xx <- c(0:4))
is.na(xx) <- c(2, 4)
xx                     #> 0 NA  2 NA  4



