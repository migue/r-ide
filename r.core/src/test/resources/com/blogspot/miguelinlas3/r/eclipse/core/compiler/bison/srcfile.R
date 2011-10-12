### Name: srcfile
### Title: References to source files
### Aliases: srcfile srcfilecopy getSrcLines srcref srcfile-class
###   srcfilecopy-class srcref-class print.srcfile open.srcfile
###   open.srcfilecopy close.srcfile print.srcref as.character.srcref
###   .isOpen
### Keywords: debugging utilities

### ** Examples

src <- srcfile(system.file("DESCRIPTION", package = "base"))
getSrcLines(src, 1, 4)
ref <- srcref(src, c(1, 1, 2, 1000))
ref
print(ref, useSource = FALSE)



