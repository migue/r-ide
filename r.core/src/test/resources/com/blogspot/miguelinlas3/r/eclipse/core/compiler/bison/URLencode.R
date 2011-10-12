### Name: URLencode
### Title: Encode or Decode a (partial) URL
### Aliases: URLencode URLdecode
### Keywords: utilities

### ** Examples

(y <- URLencode("a url with spaces and / and @"))
URLdecode(y)
(y <- URLencode("a url with spaces and / and @", reserved=TRUE))
URLdecode(y)
URLdecode("ab%20cd")



