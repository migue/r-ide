### Name: slot
### Title: The Slots in an Object from a Formal Class
### Aliases: slot slot<- @<- slotNames .slotNames getSlots
### Keywords: programming classes

### ** Examples

## Don't show: 
if(isClass("track")) removeClass("track")
## End Don't show

setClass("track", representation(x="numeric", y="numeric"))
myTrack <- new("track", x = -4:4, y = exp(-4:4))
slot(myTrack, "x")
slot(myTrack, "y") <- log(slot(myTrack, "y"))
utils::str(myTrack)

getSlots("track") # or
getSlots(getClass("track"))
slotNames(class(myTrack)) # is the same as
slotNames(myTrack)

## Don't show: 
removeClass("track")##  should not be needed... see ./setClass.Rd
## End Don't show



