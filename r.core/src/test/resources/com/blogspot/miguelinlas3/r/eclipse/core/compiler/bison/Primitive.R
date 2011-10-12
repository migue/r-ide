### Name: Primitive
### Title: Call a ``Primitive'' Internal Function
### Aliases: .Primitive primitive
### Keywords: interface

### ** Examples

mysqrt <- .Primitive("sqrt")
c
.Internal # this one *must* be primitive!
get("if") # just 'if' or 'print(if)' are not syntactically ok.



