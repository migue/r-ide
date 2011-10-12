### Name: row/colnames
### Title: Row and Column Names
### Aliases: rownames rownames<- colnames colnames<-
### Keywords: array manip

### ** Examples

m0 <- matrix(NA, 4, 0)
rownames(m0)

m2 <- cbind(1,1:4)
colnames(m2, do.NULL = FALSE)
colnames(m2) <- c("x","Y")
rownames(m2) <- rownames(m2, do.NULL = FALSE, prefix = "Obs.")
m2



