### Name: reorder.factor
### Title: Reorder Levels of a Factor
### Aliases: reorder reorder.factor reorder.character
### Keywords: utilities

### ** Examples

require(graphics)

bymedian <- with(InsectSprays, reorder(spray, count, median))
boxplot(count ~ bymedian, data = InsectSprays,
        xlab = "Type of spray", ylab = "Insect count",
        main = "InsectSprays data", varwidth = TRUE,
        col = "lightgray")



