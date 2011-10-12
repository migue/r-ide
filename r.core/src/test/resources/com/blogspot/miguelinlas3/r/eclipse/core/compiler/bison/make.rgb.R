### Name: make.rgb
### Title: Create colour spaces
### Aliases: make.rgb colorConverter
### Keywords: color

### ** Examples

(pal <- make.rgb(red=  c(0.6400,0.3300),
                 green=c(0.2900,0.6000),
                 blue= c(0.1500,0.0600),
                 name = "PAL/SECAM RGB"))

## converter for sRGB in #rrggbb format
hexcolor <- colorConverter(toXYZ = function(hex,...) {
                            rgb <- t(col2rgb(hex))/255
                            colorspaces$sRGB$toXYZ(rgb,...) },
                           fromXYZ = function(xyz,...) {
                              rgb <- colorspaces$sRGB$fromXYZ(xyz,..)
                              rgb <- round(rgb,5)
                              if (min(rgb) < 0 || max(rgb) > 1)
                                   as.character(NA)
                              else
                                   rgb(rgb[1],rgb[2],rgb[3])},
                           white = "D65", name = "#rrggbb")

(cols <- t(col2rgb(palette())))
(luv <- convertColor(cols,from="sRGB", to="Luv", scale.in=255))
(hex <- convertColor(luv, from="Luv",  to=hexcolor, scale.out=NULL))

## must make hex a matrix before using it
(cc <- round(convertColor(as.matrix(hex), from= hexcolor, to= "sRGB",
                          scale.in=NULL, scale.out=255)))
stopifnot(cc == cols)



