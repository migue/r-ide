### Name: locales
### Title: Query or Set Aspects of the Locale
### Aliases: locales Sys.getlocale Sys.setlocale
### Keywords: utilities

### ** Examples

Sys.getlocale()
Sys.getlocale("LC_TIME")
## Not run: 
##D Sys.setlocale("LC_TIME", "de")     # Solaris 7: details are OS-dependent
##D Sys.setlocale("LC_TIME", "de_DE.utf8")  # Modern Linux etc.
##D Sys.setlocale("LC_TIME", "German") # Windows
## End(Not run)
Sys.getlocale("LC_PAPER")          # may or may not be set

Sys.setlocale("LC_COLLATE", "C")   # turn off locale-specific sorting



