function [ x ] = fft_extract( fft_coef_total,fs,window_length )
%FFT_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
x=[];
N=size(fft_coef_total,1);
for i =1:size(fft_coef_total,2)
    
    fft_tmp=zeros(fs*window_length,1);
    fft_tmp(1:N)=fft_coef_total(:,i);
    fft_tmp(end-N+2:end)=fft_coef_total(end:-1:2,i)';
    
    
    tmp=ifft(fft_tmp);
    tmp=real(tmp);
    x=[x;tmp(1:fs*window_length)];
end

end
