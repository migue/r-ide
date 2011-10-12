### Name: help.search
### Title: Search the Help System
### Aliases: help.search ?? print.hsearch
### Keywords: documentation

### ** Examples

help.search("linear models")    # In case you forgot how to fit linear
                                # models
help.search("non-existent topic")

??utils::help  # All the topics matching "help" in the utils package

## Not run: 
##D help.search("print")            # All help pages with topics or title
##D                                 # matching 'print'
##D help.search(apropos = "print")  # The same
##D 
##D help.search(keyword = "hplot")  # All help pages documenting high-level
##D                                 # plots.
##D file.show(file.path(R.home(), "doc", "KEYWORDS"))  # show all keywords
##D 
##D ## Help pages with documented topics starting with 'try'.
##D help.search("\\btry", fields = "alias")
## End(Not run)


