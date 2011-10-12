### Name: zpackages
### Title: Listing of Packages
### Aliases: .packages
### Keywords: data

### ** Examples

(.packages())               # maybe just "base"
.packages(all.available = TRUE) # return all available as character vector
require(splines)
(.packages())               # "splines", too
detach("package:splines")



