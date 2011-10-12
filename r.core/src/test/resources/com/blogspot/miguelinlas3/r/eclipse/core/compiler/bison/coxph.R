### Name: coxph
### Title: Fit Proportional Hazards Regression Model
### Aliases: coxph vcov.coxph print.coxph.null print.coxph.penal
###   model.frame.coxph coxph.penalty [.coxph.penalty coxph.getdata
###   summary.coxph.penal
### Keywords: survival

### ** Examples

# Create the simplest test data set
#
 test1 <- list(time=  c(4, 3,1,1,2,2,3),
                status=c(1,NA,1,0,1,1,0),
                x=     c(0, 2,1,1,1,0,0),
                sex=   c(0, 0,0,0,1,1,1))
 coxph( Surv(time, status) ~ x + strata(sex), test1)  #stratified model

#
# Create a simple data set for a time-dependent model
#
test2 <- list(start=c(1, 2, 5, 2, 1, 7, 3, 4, 8, 8),
                stop =c(2, 3, 6, 7, 8, 9, 9, 9,14,17),
                event=c(1, 1, 1, 1, 1, 1, 1, 0, 0, 0),
                x    =c(1, 0, 0, 1, 0, 1, 1, 1, 0, 0) )

summary( coxph( Surv(start, stop, event) ~ x, test2))




