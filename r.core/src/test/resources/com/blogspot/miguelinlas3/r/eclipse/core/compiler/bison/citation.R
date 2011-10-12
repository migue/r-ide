### Name: citation
### Title: Citing R and R Packages in Publications
### Aliases: citation toBibtex.citation toBibtex.citationList
### Keywords: misc

### ** Examples

## the basic R reference
citation()

## references for a package -- might not have these installed
if(nchar(system.file(package="lattice"))) citation("lattice")
if(nchar(system.file(package="foreign"))) citation("foreign")

## extract the bibtex entry from the return value
x <- citation()
toBibtex(x)



