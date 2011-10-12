### Name: readline
### Title: Read a Line from the Terminal
### Aliases: readline
### Keywords: utilities

### ** Examples

fun <- function() {
  ANSWER <- readline("Are you a satisfied R user? ")
  if (substr(ANSWER, 1, 1) == "n")
    cat("This is impossible.  YOU LIED!\n")
  else
    cat("I knew it.\n")
}
fun()



