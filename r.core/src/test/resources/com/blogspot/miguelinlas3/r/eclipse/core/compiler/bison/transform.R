### Name: transform
### Title: Transform an Object, for Example a Data Frame
### Aliases: transform transform.default transform.data.frame
### Keywords: manip

### ** Examples

transform(airquality, Ozone = -Ozone)
transform(airquality, new = -Ozone, Temp = (Temp-32)/1.8)

attach(airquality)
transform(Ozone, logOzone = log(Ozone)) # marginally interesting ...
detach(airquality)



