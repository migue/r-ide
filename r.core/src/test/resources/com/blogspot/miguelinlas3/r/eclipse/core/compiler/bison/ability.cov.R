### Name: ability.cov
### Title: Ability and Intelligence Tests
### Aliases: ability.cov
### Keywords: datasets

### ** Examples

require(stats)
(ability.FA <- factanal(factors = 1, covmat=ability.cov))
update(ability.FA, factors=2)
update(ability.FA, factors=2, rotation="promax")



