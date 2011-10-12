### Name: Extract.factor
### Title: Extract or Replace Parts of a Factor
### Aliases: [.factor [<-.factor [[.factor
### Keywords: category

### ** Examples

## following example(factor)
(ff <- factor(substring("statistics", 1:10, 1:10), levels=letters))
ff[, drop=TRUE]
factor(letters[7:10])[2:3, drop = TRUE]



