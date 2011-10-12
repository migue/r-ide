### Name: getInitial
### Title: Get Initial Parameter Estimates
### Aliases: getInitial getInitial.default getInitial.formula
###   getInitial.selfStart
### Keywords: models nonlinear manip

### ** Examples

PurTrt <- Puromycin[ Puromycin$state == "treated", ]
getInitial( rate ~ SSmicmen( conc, Vm, K ), PurTrt )



