### Name: pictex
### Title: A PicTeX Graphics Driver
### Aliases: pictex
### Keywords: device

### ** Examples

require(graphics)

pictex()
plot(1:11,(-5:5)^2, type='b', main="Simple Example Plot")
dev.off()
##--------------------
## Not run: 
##D %% LaTeX Example
##D \documentclass{article}
##D \usepackage{pictex}
##D \begin{document}
##D %...
##D \begin{figure}[h]
##D   \centerline{\input{Rplots.tex}}
##D   \caption{}
##D \end{figure}
##D %...
##D \end{document}
##D 
##D %%-- plain TeX Example --
##D \input pictex
##D $$ \input Rplots.tex $$
## End(Not run)
##--------------------
unlink("Rplots.tex")



