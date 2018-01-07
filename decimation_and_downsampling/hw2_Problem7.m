clear all
close all
clc

%%
%Sound3
[y,Fs] = audioread('gunshots.wav');

%Pass through a bandpass filter
h1 = fir1(20,[0.1 0.2],'bandpass');
y1 = conv(y,h1);
freqz(y1)
audiowrite('gunshots_bandpass.wav',y1,Fs);
soundsc(y1,Fs);

%%
%Multiply by (-1)^n
for k=1:length(y1);
    y2(k) = (-1)^(k-1) * y1(k);
end
figure
freqz(y2)
audiowrite('gunshots_shifted.wav',y2,Fs);
soundsc(y2,Fs);

%%
%Downsample the signal
M=2;
y3 = downsample(y2,M);
figure
freqz(y3)
audiowrite('gunshots_down.wav',y3,Fs/M);
soundsc(y3,Fs/M);
