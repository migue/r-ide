### Name: pyears
### Title: Person Years
### Aliases: pyears
### Keywords: survival

### ** Examples

# 
# Simple case: a single male subject, born 6/6/36 and entered on study 6/6/55.
#

temp1 <- mdy.date(6,6,36)
temp2 <- mdy.date(6,6,55)
# Now compare the results from person-years
#
temp.age <- tcut(temp2-temp1, floor(c(-1, (18:31 * 365.24))),
        labels=c('0-18', paste(18:30, 19:31, sep='-')))
temp.yr  <- tcut(temp2, mdy.date(1,1,1954:1965), labels=1954:1964)
temp.time <- 3700   #total days of fu
py1 <- pyears(temp.time ~ temp.age + temp.yr, scale=1) #output in days

survexp.uswhite<-survexp.usr[,,"white",]
py2 <- pyears(temp.time ~ temp.age + temp.yr
                + ratetable(age=temp2-temp1, year=temp2, sex=1),
             scale=1, ratetable=survexp.uswhite ) #output in days




