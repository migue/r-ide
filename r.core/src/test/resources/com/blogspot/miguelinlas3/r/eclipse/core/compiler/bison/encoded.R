### Name: encoded_text_to_latex
### Title: Translate non-ASCII Text to LaTeX Escapes
### Aliases: encoded_text_to_latex
### Keywords: utilities

### ** Examples

x <- "fa\xE7ile"
encoded_text_to_latex(x, "latin1")
## Not run: 
##D ## create a tex file to show the upper half of 8-bit charsets
##D x <- rawToChar(as.raw(160:255), multiple=TRUE)
##D (x <- matrix(x, ncol=16, byrow=TRUE))
##D xx <- x
##D xx[] <- encoded_text_to_latex(x, "latin1") # or latin2 or latin9
##D xx <- apply(xx, 1, paste, collapse="&")
##D con <- file("test-encoding.tex", "w")
##D header <- c(
##D "\\documentclass{article}",
##D "\\usepackage[T1]{fontenc}",
##D "\\usepackage{Rd}",
##D "\\begin{document}",
##D "\\HeaderA{test}{}{test}",
##D "\\begin{Details}\relax",
##D "\\Tabular{cccccccccccccccc}{")
##D trailer <- c("}", "\\end{Details}", "\\end{document}")
##D writeLines(header, con)
##D writeLines(paste(xx, "\\", sep=""), con)
##D writeLines(trailer, con)
##D close(con)
##D ## and some UTF_8 chars
##D x <- intToUtf8(as.integer(
##D     c(160:383,0x0192,0x02C6,0x02C7,0x02CA,0x02D8,
##D       0x02D9, 0x02DD, 0x200C, 0x2018, 0x2019, 0x201C,
##D       0x201D, 0x2020, 0x2022, 0x2026, 0x20AC)),
##D                multiple=TRUE)
##D x <- matrix(x, ncol=16, byrow=TRUE)
##D xx <- x
##D xx[] <- encoded_text_to_latex(x, "UTF-8")
##D xx <- apply(xx, 1, paste, collapse="&")
##D con <- file("test-utf8.tex", "w")
##D writeLines(header, con)
##D writeLines(paste(xx, "\\", sep=""), con)
##D writeLines(trailer, con)
##D close(con)
## End(Not run)


