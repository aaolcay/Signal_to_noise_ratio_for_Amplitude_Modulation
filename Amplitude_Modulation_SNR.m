clear all;clc;close all;
Fs = 200; % Sampling frequency Fs >> 2fmax & fmax = 50 Hz
l = 2^2; % length
t = 0:1/Fs:l;
s_t = 50*(1+0.75*sin(2*pi*t)).*cos(100*pi*t);% Amplitude Modulation (AM) signal (time domain)
sdft = (1/length(s_t)).*fft(s_t); % Fourier Transform to convert into Frequency domain
                              % (Warning: The thing acquired was shifted, so you should use fftshift)
F = -10^2:(Fs/length(s_t)):10^2-(Fs/length(s_t)); % Frequency
s_f = fftshift(sdft);
figure;
subplot(211);
plot(t,s_t);
title('AM Signal (In Time Domain)');
axis([0 l -100 100]);xlabel 'Time (sec)';ylabel 'Amplitude (volts)';
subplot(212);
plot(F,abs(s_f));
title('AM Signal Spectrum (In Frequency Domain)');
axis([-100 100 0 25]);xlabel 'Frequency (Hz)';ylabel 'Amplitude (volts)';
S = psnr(abs(s_f),Fs); % A negative dBc value simply means that noise's is stronger than signal
                      % and the signal is weaker than the carrier
