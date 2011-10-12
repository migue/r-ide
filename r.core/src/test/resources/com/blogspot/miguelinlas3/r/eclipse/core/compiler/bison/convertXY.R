### Name: convertXY
### Title: Convert between Graphics Coordinate Systems
### Aliases: grconvertX grconvertY
### Keywords: dplot

### ** Examples

op <- par(omd=c(0.1, 0.9, 0.1, 0.9), mfrow = c(1, 2))
plot(1:4)
for(tp in c("in", "dev", "ndc", "nfc", "npc", "nic"))
    print(grconvertX(c(1.0, 4.0), "user", tp))
par(op)



