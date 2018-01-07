%daniil baranov
%ee 4541 dsp
%fall 2017

%read the mp3 file
[x,fs] = audioread('hw1.mp3');

%Save the new recording
audiowrite('ID_original.wav',x, fs)    



% LOW PASS FILTER

%Filter Design
d1 = fir1 (20, 0.01, 'low'); 

%Plot magnitude response of filter
fvtool(d1); 

%Filter the signal and play it 
y1 = conv(d1,x);

%Save the new recording
audiowrite('ID_LPF.wav', y1, fs)    


% BAND-PASS FILTER
	
%Filter Design
d2 = fir1 (20, [0.05 0.1], 'bandpass');

%Plot magnitude response of filter
fvtool (d2);
    
%Filter the signal and play it 
y2 = conv(d2,x);	

%Save the new recording
audiowrite('ID_BPF.wav', y2, fs)    



% ADDITION OF WHITE GAUSSIAN NOISE -- LOW PASS

%Generation of random noise
%The length of the stream of random noise should be the same as the length of the original audio file x.
r1 = randn (length(y1),1);

%Addition to original signal
y1n = y1 + 0.5 * r1;


%Save the new recording
audiowrite('ID_noise_LPF.wav', y1n, fs)    




% ADDITION OF WHITE GAUSSIAN NOISE -- BAND PASS

%Generation of random noise
%The length of the stream of random noise should be the same as the length of the original audio file x.
r2 = randn (length(y2),1);

%Addition to original signal
y2n = y2 + 0.5 * r2;


%Save the new recording
audiowrite('ID_noise_BPF.wav', y2n, fs)    

