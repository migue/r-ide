### Name: octmode
### Title: Display Numbers in Octal
### Aliases: as.octmode format.octmode print.octmode as.character.octmode
###   [.octmode octmode
### Keywords: print

### ** Examples

(on <- structure(c(16,32, 127:129),  class = "octmode")) #-> print.*()
##-> "020" "040" "177" "200" "201"
unclass(on[3:4]) # subsetting



