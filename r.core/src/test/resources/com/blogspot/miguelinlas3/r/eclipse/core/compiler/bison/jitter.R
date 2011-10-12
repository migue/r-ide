### Name: jitter
### Title: Add `Jitter' (Noise) to Numbers
### Aliases: jitter
### Keywords: dplot utilities

### ** Examples

round(jitter(c(rep(1,3),  rep(1.2, 4), rep(3,3))), 3)
## These two 'fail' with S-plus 3.x:
jitter(rep(0, 7))
jitter(rep(10000,5))



