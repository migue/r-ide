### Name: packageDescription
### Title: Package Description
### Aliases: packageDescription print.packageDescription
### Keywords: utilities

### ** Examples

packageDescription("stats")
packageDescription("stats", fields = c("Package", "Version"))

packageDescription("stats", fields = "Version")
packageDescription("stats", fields = "Version", drop = FALSE)



