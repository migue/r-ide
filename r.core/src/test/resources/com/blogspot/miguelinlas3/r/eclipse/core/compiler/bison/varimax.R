### Name: varimax
### Title: Rotation Methods for Factor Analysis
### Aliases: promax varimax
### Keywords: multivariate

### ** Examples

## varimax with normalize = TRUE is the default
fa <- factanal( ~., 2, data = swiss)
varimax(loadings(fa), normalize = FALSE)
promax(loadings(fa))



