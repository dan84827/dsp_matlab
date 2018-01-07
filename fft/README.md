# Fast Fourier Trasform Experimant

The main script is `fft_demo.m`. What is does is take the main input audio file, `announcement.wav`, and performs several interesting operations on it that have to do with the fft.

First, the script takes the "original" input signal, x(n), and computes it's fft, X(k).

Second, X(k) is compressed using the `fft_compress` function. The percentage of compression is 2.5%. This means that only the first 2.5% of the spectrum is retained after compression.

Third, the I apply the `fft_extract` function in order to reconstruct the audio file. This reconstructed signal is called x1(n).

Fourth, I generate an error audio file which contained the error signal obtained by taking the difference between x(n) and x1(n). This error signal is called e(n) and can be heard in `e.wav`.

Fifth, since I can see that the error signal contains frequency components in the mid band and no components at low frequencies, I shift the frequncy components of the error signal to lower frequencies by an ammount k and then apply the IFFT (inverse fast fourier trasform). This resulting signal is then called x2(n).

Sixth, I multiply x2(n) with an exponential term `exp((j\*2pi\*k\*n)/N)`. This final singal is called x3(n).

All of these signals can be heard in the `wav` output files and viewed in their respective time and frequency domain plots.
