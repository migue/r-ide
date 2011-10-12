### Name: cv.glm
### Title: Cross-validation for Generalized Linear Models
### Aliases: cv.glm
### Keywords: regression

### ** Examples

# leave-one-out and 6-fold cross-validation prediction error for 
# the mammals data set.
data(mammals, package="MASS")
mammals.glm <- glm(log(brain)~log(body),data=mammals)
cv.err <- cv.glm(mammals,mammals.glm)
cv.err.6 <- cv.glm(mammals, mammals.glm, K=6)

# As this is a linear model we could calculate the leave-one-out 
# cross-validation estimate without any extra model-fitting.
muhat <- mammals.glm$fitted
mammals.diag <- glm.diag(mammals.glm)
cv.err <- mean((mammals.glm$y-muhat)^2/(1-mammals.diag$h)^2)

# leave-one-out and 11-fold cross-validation prediction error for 
# the nodal data set.  Since the response is a binary variable an
# appropriate cost function is
cost <- function(r, pi=0) mean(abs(r-pi)>0.5)

nodal.glm <- glm(r~stage+xray+acid,binomial,data=nodal)
cv.err <- cv.glm(nodal, nodal.glm, cost, K=nrow(nodal))$delta 
cv.11.err <- cv.glm(nodal, nodal.glm, cost, K=11)$delta 



