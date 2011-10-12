### Name: connections
### Title: Functions to Manipulate Connections
### Aliases: connections connection file clipboard pipe fifo gzfile unz
###   bzfile url socketConnection open open.connection isOpen isIncomplete
###   close close.connection flush flush.connection print.connection
###   summary.connection
### Keywords: file connection

### ** Examples

zz <- file("ex.data", "w")  # open an output file connection
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
cat("One more line\n", file = zz)
close(zz)
readLines("ex.data")
unlink("ex.data")

zz <- gzfile("ex.gz", "w")  # compressed file
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
close(zz)
readLines(zz <- gzfile("ex.gz"))
close(zz)
unlink("ex.gz")

zz <- bzfile("ex.bz2", "w")  # bzip2-ed file
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
close(zz)
print(readLines(zz <- bzfile("ex.bz2")))
close(zz)
unlink("ex.bz2")

## An example of a file open for reading and writing
Tfile <- file("test1", "w+")
c(isOpen(Tfile, "r"), isOpen(Tfile, "w")) # both TRUE
cat("abc\ndef\n", file=Tfile)
readLines(Tfile)
seek(Tfile, 0, rw="r") # reset to beginning
readLines(Tfile)
cat("ghi\n", file=Tfile)
readLines(Tfile)
close(Tfile)
unlink("test1")

## We can do the same thing with an anonymous file.
Tfile <- file()
cat("abc\ndef\n", file=Tfile)
readLines(Tfile)
close(Tfile)

## No test: 
## fifo example -- may fail, e.g. on Cygwin, even with OS support for fifos
if(capabilities("fifo")) {
  zz <- fifo("foo-fifo", "w+")
  writeLines("abc", zz)
  print(readLines(zz))
  close(zz)
  unlink("foo-fifo")
}
## End(No test)

## No test: 
## Unix examples of use of pipes

# read listing of current directory
readLines(pipe("ls -1"))

# remove trailing commas. Suppose
## Don't show: 
writeLines(c("450, 390, 467, 654,  30, 542, 334, 432, 421,",
"357, 497, 493, 550, 549, 467, 575, 578, 342,",
"446, 547, 534, 495, 979, 479"), "data2_")
## End Don't show
## Not run: 
##D % cat data2
##D 450, 390, 467, 654,  30, 542, 334, 432, 421,
##D 357, 497, 493, 550, 549, 467, 575, 578, 342,
##D 446, 547, 534, 495, 979, 479
## End(Not run)
# Then read this by
scan(pipe("sed -e s/,$// data2_"), sep=",")
## Don't show: 
unlink("data2_")
## End Don't show

# convert decimal point to comma in output: see also write.table
# both R strings and (probably) the shell need \ doubled
zz <- pipe(paste("sed s/\\\\./,/ >", "outfile"), "w")
cat(format(round(stats::rnorm(48), 4)), fill=70, file = zz)
close(zz)
file.show("outfile", delete.file=TRUE)

## example for a machine running a finger daemon

con <- socketConnection(port = 79, blocking = TRUE)
writeLines(paste(system("whoami", intern=TRUE), "\r", sep=""), con)
gsub(" *$", "", readLines(con))
close(con)
## End(No test)

## Not run: 
##D ## two R processes communicating via non-blocking sockets
##D # R process 1
##D con1 <- socketConnection(port = 6011, server=TRUE)
##D writeLines(LETTERS, con1)
##D close(con1)
##D 
##D # R process 2
##D con2 <- socketConnection(Sys.info()["nodename"], port = 6011)
##D # as non-blocking, may need to loop for input
##D readLines(con2)
##D while(isIncomplete(con2)) {Sys.sleep(1); readLines(con2)}
##D close(con2)
##D 
##D ## examples of use of encodings
##D cat(x, file = (con <- file("foo", "w", encoding="UTF-8"))); close(con)
##D # read a 'Windows Unicode' file
##D A <- read.table(con <- file("students", encoding="UCS-2LE")); close(con)
## End(Not run)


