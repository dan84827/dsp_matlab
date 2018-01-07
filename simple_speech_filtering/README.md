# Simple Filtering of an MP3 Audio Signal
In order for this progam to work, you must provide an mp3 speech signal. Then load the audio file into MATLAB and see how the different filtering affects the signal.

Note that the Sampling frequency of MP3 is 44.1 kHz. 

First, the signal is filtered by a low-pass filter with a cuttoff angular frequency of 0.01\*pi.

Next, my origial signal is filtered by a band-pass filter that has a passband of 0.05\*pi to 0.1\*pi.

After this, I add a random white Gaussian noise to the original audio signal and repeat the previous two operations.


