### Name: Extract.data.frame
### Title: Extract or Replace Parts of a Data Frame
### Aliases: [.data.frame [[.data.frame [<-.data.frame [[<-.data.frame
###   $<-.data.frame
### Keywords: array

### ** Examples

sw <- swiss[1:5, 1:4]  # select a manageable subset

sw[1:3]      # select columns
sw[, 1:3]    # same
sw[4:5, 1:3] # select rows and columns
sw[1]        # a one-column data frame
sw[, 1, drop = FALSE]  # the same
sw[, 1]      # a (unnamed) vector
sw[[1]]      # the same

sw[1,]       # a one-row data frame
sw[1,, drop=TRUE]  # a list

sw["C", ] # partially matches
sw[match("C", row.names(sw)), ] # no exact match

## Don't show: 
stopifnot(identical(sw[,1], sw[[1]]),
          identical(sw[,1][1], 80.2),
          identical(sw[,1, drop = FALSE], sw[1]),
          is.data.frame(sw[1]), dim(sw[1] ) == c(5,1),
          is.data.frame(sw[1,]),dim(sw[1,]) == c(1,4),
          is.list(s1 <- sw[1,, drop=TRUE]), identical(s1$Fertility, 80.2))
## End Don't show
swiss[ c(1, 1:2), ]   # duplicate row, unique row names are created

sw[sw <= 6] <- 6  # logical matrix indexing
sw

## adding a column
sw["new1"] <- LETTERS[1:5]   # adds a character column
sw[["new2"]] <- letters[1:5] # ditto
sw[, "new3"] <- LETTERS[1:5] # ditto
sw$new4 <- 1:5
sapply(sw, class)
sw$new4 <- NULL              # delete the column
sw
sw[6:8] <- list(letters[10:14], NULL, aa=1:5)
# delete col7, update 6, append
sw

## matrices in a data frame
A <- data.frame(x=1:3, y=I(matrix(4:6)), z=I(matrix(letters[1:9],3,3)))
A[1:3, "y"] # a matrix
A[1:3, "z"] # a matrix
A[, "y"]    # a matrix



