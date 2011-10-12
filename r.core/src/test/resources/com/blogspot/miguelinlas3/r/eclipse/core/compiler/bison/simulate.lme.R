### Name: simulate.lme
### Title: Simulate results from lme models
### Aliases: simulate.lme plot.simulate.lme print.simulate.lme
### Keywords: models

### ** Examples

## Not run: 
##D orthSim <-
##D    simulate.lme(list(fixed = distance ~ age, data = Orthodont,
##D                      random = ~ 1 | Subject), nsim = 1000,
##D                 m2 = list(random = ~ age | Subject))
## End(Not run)



