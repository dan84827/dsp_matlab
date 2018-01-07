function [ fft_coef, ifft_x ] = fft_compress( x,percentage )
%FFT_COMPRESS Summary of this function goes here
%   Detailed explanation goes here
    
%x=randn(1024,1);
N_fft=2^nextpow2(length(x));
    N_fft=length(x);
    fft_x=fft(x,N_fft);
    fft_x=fft_x(:);
    
%     penalty=triang(N_fft+1);
%     penalty=penalty/penalty(1);
%     fft_x_penalized=fft_x./penalty(1:end-1);
%     
%     [a b]=sort(abs(fft_x_penalized),'descend');
%     th=(a(  round(percentage*N_fft))+a(  round(percentage*N_fft)+1))/2;
%     
    

    N= round(percentage*N_fft);
    %fft_coef=zeros(size(fft_x));
    fft_coef=fft_x([1:N]);

    ifft_x = ifft(fft_coef,N_fft);
end
