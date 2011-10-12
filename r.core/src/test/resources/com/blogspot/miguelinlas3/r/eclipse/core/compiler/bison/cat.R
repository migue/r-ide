### Name: cat
### Title: Concatenate and Print
### Aliases: cat
### Keywords: print file connection

### ** Examples

iter <- stats::rpois(1, lambda=10)
## print an informative message
cat("iteration = ", iter <- iter + 1, "\n")

## 'fill' and label lines:
cat(paste(letters, 100* 1:26), fill = TRUE,
    labels = paste("{",1:10,"}:",sep=""))



