### Name: fft
### Title: Fast Discrete Fourier Transform
### Aliases: fft mvfft
### Keywords: math dplot

### ** Examples

x <- 1:4
fft(x)
fft(fft(x), inverse = TRUE)/length(x)



