### Name: alias
### Title: Find Aliases (Dependencies) in a Model
### Aliases: alias alias.formula alias.lm
### Keywords: models

### ** Examples

## From Venables and Ripley (2002) p.165.
utils::data(npk, package="MASS")

op <- options(contrasts=c("contr.helmert", "contr.poly"))
npk.aov <- aov(yield ~ block + N*P*K, npk)
alias(npk.aov)
options(op)# reset



