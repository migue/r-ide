### Name: message
### Title: Diagnostic Messages
### Aliases: message suppressMessages packageStartupMessage
###   .packageStartupMessage suppressPackageStartupMessages .makeMessage
### Keywords: programming

### ** Examples

message("ABC", "DEF")
suppressMessages(message("ABC"))

testit <- function() {
  message("testing package startup messages")
  packageStartupMessage("initializing ...", appendLF = FALSE)
  Sys.sleep(1)
  packageStartupMessage(" done")
}

testit()
suppressPackageStartupMessages(testit())
suppressMessages(testit())



