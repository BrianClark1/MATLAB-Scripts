%Programming Assignment 4 Task 3
close all
clear
clc

[y,Fs] = audioread('Task3.mp3') ;  %Import Data

totaltime = length(y) / Fs ;
deltatime=totaltime/length(y);

%%Build time vector
time=zeros(length(y),1);
for i=2:length(time)-1
    time(i+1)=time(i)+deltatime;
end

figure (1) 
subplot(2,1,1) 
plot(time,y)
xlabel('Time [s]')
ylabel('Amplitude')
grid on

%Discrete Fourier Transform
Fn=zeros(length(y),1);
N=length(y);

for n=1:(N)
    sigma=0;
    for z=0:N-1
        omega=-z*sqrt(-1)*((2*pi)/N)*n;
        sigma=sigma+y(z+1)*exp(omega);
    end
    
    Fn(n)=sigma;
end

%Power Spectrum


d=real(Fn);    %Real components of Fn
u=imag(Fn);    % Imaginary


for i = 1:1101
Pk(i)= 2*(sqrt(d(i).^2+u(i).^2)).^2 ;
end

figure(2)
frq = linspace(0,1100,1100+1) ; 
subplot(2,1,2)
plot(frq,Pk)
xlabel('Frequency [Hz]') ;
ylabel('Power [Db]') ;
grid on


                           



