### Name: callGeneric
### Title: Call the Current Generic Function from a Method
### Aliases: callGeneric
### Keywords: programming classes methods

### ** Examples

## the method for group generic function Ops
## for signature( e1="structure", e2="vector")
function (e1, e2)
{
    value <- callGeneric(e1@.Data, e2)
    if (length(value) == length(e1)) {
        e1@.Data <- value
        e1
    }
    else value
}

## For more examples
## Not run: 
##D showMethods("Ops", includeDefs = TRUE)
## End(Not run)




