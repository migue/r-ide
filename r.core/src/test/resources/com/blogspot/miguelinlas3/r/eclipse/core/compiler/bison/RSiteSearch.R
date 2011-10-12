### Name: RSiteSearch
### Title: Search for Key Words or Phrases in the R-help Mailing List
###   Archives or Documentation
### Aliases: RSiteSearch
### Keywords: utilities documentation

### ** Examples
## No test: 
 # need Internet connection
RSiteSearch("{logistic regression}") # matches exact phrase
Sys.sleep(5) # allow browser to open, take a quick look
RSiteSearch("Baron Liaw", restrict = "Rhelp02a")
## Search in R-devel archive and documents  (and store the query-string):
Sys.sleep(5)
fullquery <- RSiteSearch("S4", restrict = c("R-dev", "docs"))
fullquery # a string of ~ 116 characters
## the latest purported bug reports, responses ...
Sys.sleep(5)
RSiteSearch("bug", restrict = "R-devel", sortby = "date:late")
## End(No test)


