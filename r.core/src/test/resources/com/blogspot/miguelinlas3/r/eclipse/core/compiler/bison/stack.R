### Name: stack
### Title: Stack or Unstack Vectors from a Data Frame or List
### Aliases: stack stack.default stack.data.frame unstack unstack.default
###   unstack.data.frame
### Keywords: manip

### ** Examples

require(stats)
formula(PlantGrowth)         # check the default formula
pg <- unstack(PlantGrowth)   # unstack according to this formula
pg
stack(pg)                    # now put it back together
stack(pg, select = -ctrl)    # omitting one vector



