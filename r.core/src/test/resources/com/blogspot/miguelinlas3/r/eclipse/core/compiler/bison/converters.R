### Name: getNumCConverters
### Title: Management of .C argument conversion list
### Aliases: getNumCConverters getCConverterDescriptions
###   getCConverterStatus setCConverterStatus removeCConverter
### Keywords: interface programming

### ** Examples

getNumCConverters()
getCConverterDescriptions()
getCConverterStatus()
## Not run: 
##D old <- setCConverterStatus(1, FALSE)
##D 
##D setCConverterStatus(1, old)
## End(Not run)
## Not run: 
##D removeCConverter(1)
##D removeCConverter(getCConverterDescriptions()[1])
## End(Not run)


