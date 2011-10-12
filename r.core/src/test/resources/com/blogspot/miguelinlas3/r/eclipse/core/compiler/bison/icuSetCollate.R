### Name: icuSetCollate
### Title: Setup Collation by ICU
### Aliases: icuSetCollate
### Keywords: utilities

### ** Examples
## No test: 
x <- c("Aarhus", "aarhus", "safe", "test", "Zoo")
sort(x)
icuSetCollate(case_first="upper"); sort(x)
icuSetCollate(case_first="lower"); sort(x)

icuSetCollate(locale="da_DK", case_first="default"); sort(x)
icuSetCollate(locale="et_EE"); sort(x)
## End(No test)


