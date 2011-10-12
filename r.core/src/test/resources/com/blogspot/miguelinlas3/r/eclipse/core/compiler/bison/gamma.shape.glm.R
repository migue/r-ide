### Name: gamma.shape
### Title: Estimate the Shape Parameter of the Gamma Distribution in a GLM
###   Fit
### Aliases: gamma.shape gamma.shape.glm print.gamma.shape
### Keywords: models

### ** Examples

clotting <- data.frame(
    u = c(5,10,15,20,30,40,60,80,100),
    lot1 = c(118,58,42,35,27,25,21,19,18),
    lot2 = c(69,35,26,21,18,16,13,12,12))
clot1 <- glm(lot1 ~ log(u), data = clotting, family = Gamma)
gamma.shape(clot1)
## Not run: 
##D Alpha: 538.13
##D    SE: 253.60
## End(Not run)
gm <- glm(Days + 0.1 ~ Age*Eth*Sex*Lrn,
          quasi(link=log, variance="mu^2"), quine,
          start = c(3, rep(0,31)))
gamma.shape(gm, verbose = TRUE)
## Not run: 
##D Initial estimate: 1.0603
##D Iter.  1  Alpha: 1.23840774338543
##D Iter.  2  Alpha: 1.27699745778205
##D Iter.  3  Alpha: 1.27834332265501
##D Iter.  4  Alpha: 1.27834485787226
##D 
##D Alpha: 1.27834
##D    SE: 0.13452
## End(Not run)
summary(gm, dispersion = gamma.dispersion(gm))  # better summary



