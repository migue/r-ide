### Name: gettext
### Title: Translate Text Messages
### Aliases: gettext ngettext bindtextdomain
### Keywords: utilities character

### ** Examples

bindtextdomain("R")  # non-null if and only if NLS is enabled

for(n in 0:3)
    print(sprintf(ngettext(n, "%d variable has missing values",
                              "%d variables have missing values"),
                  n))

## Not run: 
##D ## for translation, those strings should appear in R-pkg.pot as
##D msgid        "%d variable has missing values"
##D msgid_plural "%d variables have missing values"
##D msgstr[0] ""
##D msgstr[1] ""
## End(Not run)

miss <- c("one", "or", "another")
cat(ngettext(length(miss), "variable", "variables"),
    paste(sQuote(miss), collapse=", "),
    ngettext(length(miss), "contains", "contain"), "missing values\n")

## better for translators would be to use
cat(sprintf(ngettext(length(miss),
                     "variable %s contains missing values\n",
                     "variables %s contain missing values\n"),
            paste(sQuote(miss), collapse=", ")))



