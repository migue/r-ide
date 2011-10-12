### Name: method.skeleton
### Title: Create a Skeleton File for a New Method
### Aliases: method.skeleton
### Keywords: programming methods

### ** Examples

## Don't show: 
oWD <- setwd(tempdir())
## End Don't show
setClass("track", representation(x ="numeric", y="numeric"))
method.skeleton("show", "track")            ## writes show_track.R
method.skeleton("Ops", c("track", "track")) ## writes "Ops_track_track.R"

## write multiple method skeletons to one file
con <- file("./Math_track.R", "w")
method.skeleton("Math", "track", con)
method.skeleton("exp", "track", con)
method.skeleton("log", "track", con)
close(con)
## Don't show: 
setwd(oWD)
## End Don't show



