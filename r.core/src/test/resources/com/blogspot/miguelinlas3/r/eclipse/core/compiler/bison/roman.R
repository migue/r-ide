### Name: roman
### Title: Roman Numerals
### Aliases: as.roman
### Keywords: arith

### ** Examples

## First five roman 'numbers'.
(y <- as.roman(1 : 5))
## Middle one.
y[3]
## Current year as a roman number.
(y <- as.roman(format(Sys.Date(), "%Y")))
## 10 years ago ...
y - 10



