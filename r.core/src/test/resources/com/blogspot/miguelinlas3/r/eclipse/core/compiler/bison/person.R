### Name: person
### Title: Person Names and Contact Information
### Aliases: person as.person as.person.default personList as.personList
###   as.personList.person as.personList.default as.character.person
###   as.character.personList toBibtex.person toBibtex.personList
### Keywords: misc

### ** Examples

## create a person object directly
p1 <- person("Karl", "Pearson", email = "pearson@stats.heaven")
p1

## convert a string
p2 <- as.person("Ronald Aylmer Fisher")
p2

## create one object holding both
p <- personList(p1, p2)
ps <- as.character(p)
ps
as.personList(ps)

## convert to BibTeX author field
toBibtex(p)



