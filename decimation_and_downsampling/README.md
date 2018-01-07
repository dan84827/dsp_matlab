# Decimation and Downsampling

This matlab program does some some interesting operations on the input audio file `gunshots.wav`. 

First, I compute the original spectrum. 

Second, I apply a bandpass filter to the original audio signal with cutoff frequencies 0.1\*pi and 0.2\*pi. This gives me the output waveform y(n), which can be heard in the audio file `ID_AUDIO_y.wav`.

Third, I get an additional audio signal, z(n), as a result of multipying the bandpass filtered signal with (-1)^n. z(n) can be heard in the audio file `ID_AUDIO_z.wav`.

Finally, I get a signal called w(n) as a result of downsampling z(n) by a factor of 2. This downsampled signal can of course be heard in `ID_AUDIO_z.wav`.

It is imortant to note that multiplying a signal by (−1)^n results in a shift in the frequency domain by pi. Hence, the resultant audio signal consists of high frequency content inaudible to the human ear. However, downsampling this signal by a factor of 2 results in scaling of the frequency by 2, bringing the signal back into the audible frequency range. The effects of these properties are clearly observed in the modified sounds obtained.
