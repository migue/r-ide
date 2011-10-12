### Name: Type1Font
### Title: Type 1 and CID Fonts
### Aliases: Type1Font CIDFont
### Keywords: device

### ** Examples

## This duplicates "ComputerModernItalic".
CMitalic <- Type1Font("ComputerModern2",
                      c("CM_regular_10.afm", "CM_boldx_10.afm",
                        "cmti10.afm", "cmbxti10.afm",
                        "CM_symbol_10.afm"),
                      encoding = "TeXtext.enc")

## Not run: 
##D ## This could be used by
##D postscript(family = CMitalic)
##D ## or
##D postscriptFonts(CMitalic = CMitalic)  # once in a session
##D postscript(family = "CMitalic", encoding = "TeXtext.enc")
## End(Not run)


