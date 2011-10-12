### Name: load
### Title: Reload Saved Datasets
### Aliases: load
### Keywords: file

### ** Examples

## save all data
xx <- pi # to ensure there is some data
save(list = ls(all=TRUE), file= "all.Rdata")
rm(xx)

## restore the saved values to the current environment
local({
   load("all.Rdata")
   ls()
})
## restore the saved values to the user's workspace
load("all.Rdata", .GlobalEnv)

unlink("all.Rdata")

## Not run: 
##D con <- url("http://some.where.net/R/data/example.rda")
##D ## print the value to see what objects were created.
##D print(load(con))
##D close(con) # url() always opens the connection
## End(Not run)


