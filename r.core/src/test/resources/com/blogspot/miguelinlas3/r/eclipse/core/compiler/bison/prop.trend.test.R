### Name: prop.trend.test
### Title: Test for trend in proportions
### Aliases: prop.trend.test
### Keywords: htest

### ** Examples

smokers  <- c( 83, 90, 129, 70 )
patients <- c( 86, 93, 136, 82 )
prop.test(smokers, patients)
prop.trend.test(smokers, patients)
prop.trend.test(smokers, patients,c(0,0,0,1))



