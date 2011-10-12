### Name: installed.packages
### Title: Find Installed Packages
### Aliases: installed.packages
### Keywords: utilities

### ** Examples

str(ip <- installed.packages(priority = "high"))
ip[, c(1,3:5)]
plic <- installed.packages(priority = "high", fields="License")
## what licenses are there:
table( plic[,"License"] )



