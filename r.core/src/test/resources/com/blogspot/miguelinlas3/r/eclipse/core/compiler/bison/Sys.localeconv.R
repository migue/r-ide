### Name: localeconv
### Title: Find Details of the Numerical and Monetary Representations in
###   the Current Locale
### Aliases: localeconv Sys.localeconv
### Keywords: utilities

### ** Examples

Sys.localeconv()
## The results in the C locale are
##    decimal_point     thousands_sep          grouping   int_curr_symbol 
##              "."                ""                ""                "" 
##  currency_symbol mon_decimal_point mon_thousands_sep      mon_grouping 
##               ""                ""                ""                "" 
##    positive_sign     negative_sign   int_frac_digits       frac_digits 
##               ""                ""             "127"             "127" 
##    p_cs_precedes    p_sep_by_space     n_cs_precedes    n_sep_by_space 
##            "127"             "127"             "127"             "127" 
##      p_sign_posn       n_sign_posn 
##            "127"             "127"

## Now try your default locale (which might be "C").
## Not run: 
##D old <- Sys.getlocale()
##D Sys.setlocale(locale = "")
##D Sys.localeconv()
##D Sys.setlocale(locale = old)
## End(Not run)

## Not run: read.table("foo", dec=Sys.localeconv()["decimal_point"])



