clear all; close all; clc;
% before running this script, you need to have your music file
% 'announcement.wav' in the folder
% load the wave file
[x, fs] = audioread('announcement.wav');

fprintf('now playing original sound track \n')
%sound(x, fs);
%pause(20)

n=length(x);  %number of samples
window_length=1;  % in seconds
percentage=0.025;  % percentage of most significant fft coefficients left after thresholding

sld_window=[1:fs*window_length];  % non overlapping sliding window
k=1;
while sld_window(end)<=n
    fft_coef=fft_compress(x(sld_window),percentage);
    fft_coef_total(:,k)=fft_coef(:);
    k=k+1;
    sld_window=sld_window+fs*window_length;
end
r_fft_coef_total=single(real(fft_coef_total));
i_fft_coef_total=single(imag(fft_coef_total));
save('compressed_sound','r_fft_coef_total','i_fft_coef_total');

x_reconstruct=fft_extract(r_fft_coef_total+1i*i_fft_coef_total, fs, window_length);
error=x(1:size(x_reconstruct))-x_reconstruct;

%Take FFT of the error and shift the frequency components to low frequency
e_fft = fft(error);
Nfft = size(error,1);
shift_e_fft = [e_fft(percentage*Nfft: Nfft/2); ones(percentage*Nfft*2,1)-1; e_fft(Nfft/2+1: Nfft-percentage*Nfft)];
x2_reconstruct=ifft(shift_e_fft);

%Multiply the shifted frequency with the exponential function
k = percentage * Nfft;
for n=1:length(x2_reconstruct)
    x2(n) = x2_reconstruct(n) .* exp(i*2*pi/Nfft*k*(n-1));
end
x2 = real(x2);

%Plots in time domain
%subplot(511)
%plot(x)
%title('original sound track')
subplot(512)
plot(x_reconstruct)
title('Plot\_x1\_time')
subplot(513)
plot(error)
title('Plot\_e\_time')
subplot(514)
plot(real(x2_reconstruct))
title('Plot\_x2\_time')
subplot(515)
plot(x2)
title('Plot\_x3\_time')

%Play all genrated sounds
fprintf('now playing reconstructed sound track \n')
audiowrite('x1.wav', x_reconstruct, fs);
%sound(x_reconstruct, fs);
% pause(20)
fprintf('now playing error between sound tracks \n')
audiowrite('e.wav', error, fs);
%sound(error,fs)
%pause(20)
fprintf('now playing shifted error between sound tracks \n')
audiowrite('x2.wav', x2_reconstruct, fs);
%sound(real(x2_reconstruct),fs)
%pause(20)
fprintf('now playing error shifted and multiplied with exponential\n')
audiowrite('x3.wav', x2, fs);
%sound(x2,fs)
%pause(20)

%Plots in frequency domain
figure
%subplot(511)
%plot(abs(fft(x)))
subplot(512)
plot(abs(fft(x_reconstruct)))
title('Plot\_x1\_freq')
subplot(513)
plot(abs(fft(error)))
title('Plot\_e\_freq')
subplot(514)
plot(abs(fft(x2_reconstruct)))
title('Plot\_x2\_freq')
subplot(515)
plot(abs(fft(x2)))
title('Plot\_x3\_freq')
