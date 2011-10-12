### Name: nrow
### Title: The Number of Rows/Columns of an Array
### Aliases: nrow NROW ncol NCOL
### Keywords: array

### ** Examples

ma <- matrix(1:12, 3, 4)
nrow(ma)   # 3
ncol(ma)   # 4

ncol(array(1:24, dim = 2:4)) # 3, the second dimension
NCOL(1:12) # 1
NROW(1:12) # 12



