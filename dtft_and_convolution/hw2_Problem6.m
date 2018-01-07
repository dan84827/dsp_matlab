clc;
clear all;
close all;
Wc = pi/6;
w=(-1024:1024)/(1024); %-pi to pi

for n=-100:1:100
y(n+101) = (((sin(Wc*n))/(n*pi)));
end
y(101) = (1/6)*sinc(0); 
y = sqrt(6).*y; % to normalize the peak magnitude of spectrum to 1
for n=1:201
x(n) = y(n)*y(n);
end
N=size(x);
H=zeros(1,2049);
for k = 1:1:N(2)
    H=H+x(k)*exp(-1i*w*pi*k);
end
n = -100:100;
figure(1);
plot(w,abs(H));
title('DTFT of discrete time sequence x(n)');


% Part (a)
w0 = pi/4;
for n=1:201
x1(n) = x(n)*exp(i*n*(w0));
end
N=size(x1);
H=zeros(1,2049);
for k = 1:1:N(2)
    H=H+x1(k)*exp(-1i*w*pi*k);
end
figure(2);
plot(w,abs(H));
title ('DTFT of x1(n)---------Multiplication x(n) with exp(i*w0*n) in time domain');


%Part (b)
Wc1 = pi/4;
for n=-100:1:100
sig1(n+101) = (((sin(Wc1*n))/(n*pi)));
end
sig1(101) = (1/4)*sinc(0); 

x2 = conv(sig1,x);
N = size(x2);
H=zeros(1,2049);
for k = 1:1:N(2)
    H=H+x2(k)*exp(-1i*w*pi*k);
end
n = -200:200;
figure(3);
subplot(2,1,1);
plot(n,real(x2));
title('Discrete time sequence x2(n)');
subplot(2,1,2);
plot(w,abs(H));
title ('DTFT of x2(n)-------Convolution of x(n) with sin(n*pi/4)/(n*pi) ');

% Part (c)
Wc1 = pi/4;
for n=-100:1:100
sig2(n+101) = (sin(Wc1*n));
end 
%sig2 = ((pi/4)*(1/100)).* sig2;
x3 = conv(sig2,x);
N = size(x3);
H=zeros(1,2049);
for k = 1:1:N(2)
    H=H+x3(k)*exp(-1i*w*pi*k);
end
n = -200:200;
figure(4);
subplot(2,1,1);
plot(n,(x3));
title('Discrete time sequence x3(n)');
subplot(2,1,2);
plot(w,abs(H));
title ('DTFT of x3(n)-------Convolution of x(n) with sin(n*pi/4) ');

% Part(d)
for n=1:201
x4(n) = sig2(n)*x(n);
end
N = size(x4);
H=zeros(1,2049);
for k = 1:1:N(2)
    H=H+x4(k)*exp(-1i*w*pi*k);
end
n = -100:100;
figure(5);
subplot(2,1,1);
plot(n,(x4));
title('Discrete time sequence x4(n)');
subplot(2,1,2);
plot(w,abs(H));
title ('DTFT of x4(n)-------Multiplication of x(n) with sin(n*pi/4) in time domain');

