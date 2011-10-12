### Name: png
### Title: BMP, JPEG, PNG and TIFF graphics devices
### Aliases: png jpeg tiff bmp
### Keywords: device

### ** Examples

## these examples will work only if the devices are available
## and either cairo or an X11 display is available.

## copy current plot to a (large) PNG file
## Not run: dev.print(png, file="myplot.png", width=1024, height=768)
## No test: 
png(file="myplot.png", bg="transparent")
plot(1:10)
rect(1, 5, 3, 7, col="white")
dev.off()

## will make myplot1.jpeg and myplot2.jpeg
jpeg(file="myplot%d.jpeg")
example(rect)
dev.off()
## End(No test)


