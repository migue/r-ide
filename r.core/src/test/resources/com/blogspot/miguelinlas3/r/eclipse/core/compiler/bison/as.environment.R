### Name: as.environment
### Title: Coerce to an Environment Object
### Aliases: as.environment
### Keywords: data environment

### ** Examples

as.environment(1) ## the global environment
identical(globalenv(), as.environment(1)) ## is TRUE
try(as.environment("package:stats"))      ## stats need not be loaded



