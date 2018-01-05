%{
%==========================================================================
MPHY3B27 - COMPUTING IN MEDICINE
Task 4 - Signal S=fft(s) in the frequency domain for different values of f0
and sigma.

Aasim Patel
05/01/2018
%=========================================================================
%}

%DEFINITIONS OF VARIABLES AND DOMAIN --------------------------------------
%source plane
xs=0;
ys=0;
zs=0;

%observation plane
x=1e-3;
y=1e-3;
z=0;

%set parameters
p0=1;
c=1500;

%time
dt=1e-8;
tp=0:dt:3e-6;

%--------------------------------------------------------------------------

%call the function to calculate the pressure field
pressure = comp_press_field_point_source(p0,c,x,y,z,tp,dt,xs,ys,zs);

%{
figure(1);
plot(t,pressure);
title('Pressure');
xlabel('Time (secs)');
ylabel('Pressure (Pa)');
%}

%constants and arrays
sigma = 50e-9;
sigma_array = -4*sigma : sigma: 4*sigma;
tp= -4*sigma: 1e-8: 4*sigma;
dt = 1e-8;
f0 = 10e6;

%call Gaussian tone burst function for single f0 and sigma
Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);

%{
figure(2);
plot(t,Gauss_press);
title('Gaussian Tone Burst');
xlabel('Time (secs)');
ylabel('Pressure (Pa)');
%}

%Convolution of the pressure and Gaussian Tone Burst to get s(t)
%For f0=10MHz and sigma=50ns
s = conv(pressure, Gauss_press);

tp = -4*sigma: dt :4*sigma;
t = linspace(0,3e-6,341);

%PLOT FOR f0=10MHz AND sigma=50ns -----------------------------------------
figure(3);
plot(t,s);
title('Convoluted signal s(t) for f0=10MHz and sigma=50ns');
xlabel('Time (s)');
ylabel('Pressure (Pa)');

%Find the signal in the Frequency Domain
S = fft(s);

%Convert time domain into frequency domain
for i = 1:length(t)
    f(i)=1/t(i);
end

f(1:10)
size(f);

figure(4);
%plot(f,abs(S))
%axis([0, 1e6,0,400]);
title('Amplitude Spectrum S(f) in the Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('S(f) - FFT of convoluted signal s(t)');

%Now using a frequency of 20MHz and Sigma 100ns:
f0 = 20e6;
sigma = 100e-9;
Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);

s = conv(pressure, Gauss_press);
S = fft(s);
t = linspace(0,3e-6,length(S));
for i=1:length(t)
    f(i)=1/t(i);
end

%{
figure(5);
plot(f,abs(S));
title('Pressure for f=20MHz and sigma=100ns');
xlabel('Frequency (Hz)');
ylabel('S(f)');
%}

%--------------------------------------------------------------------------

% FOR DIFFERENT VALUES f0 AND sigma ---------------------------------------
f0 = 20e6: 10e6: 40e6;
sigma = 50e-9: 50e-9: 150e-9;

%compute Gaussian Tone Burst for f0=20MHz and sigma=[50,100,150]ns
Gauss_press1 = comp_Gaussian_tone_burst(f0(1),sigma(1),dt);
Gauss_press2 = comp_Gaussian_tone_burst(f0(1),sigma(2),dt);
Gauss_press3 = comp_Gaussian_tone_burst(f0(1),sigma(3),dt);
%compute Gaussian Tone Burst for f0=30MHz and sigma=[50,100,150]ns
Gauss_press4 = comp_Gaussian_tone_burst(f0(2),sigma(1),dt);
Gauss_press5 = comp_Gaussian_tone_burst(f0(2),sigma(2),dt);
Gauss_press6 = comp_Gaussian_tone_burst(f0(2),sigma(3),dt);

%compute signal for f0=20MHz and sigma=[50,100,150]ns
s1 = conv(pressure, Gauss_press1);
s2 = conv(pressure, Gauss_press2);
s3 = conv(pressure, Gauss_press3);
%compute signal for f0=30MHz and sigma=[50,100,150]ns
s4 = conv(pressure, Gauss_press4);
s5 = conv(pressure, Gauss_press5);
s6 = conv(pressure, Gauss_press6);

t = linspace(0,3e-6,421);

%Subplot for f0=20MHz and sigma=[50,100,150]ns
figure(6);
subplot(3,1,1);
plot(t(1:341),s1)
title('f0 = 20MHz and sigma = 50ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,2);
plot(t(1:381),s2)
title('f0 = 20MHz and sigma = 100ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,3);
plot(t(1:421), s3)
title('f0 = 20MHz and sigma = 150ns');
xlabel('time (s)');
ylabel('s(t)');

%Subplot for f0=30MHz and sigma=[50,100,150]ns
figure(7);
subplot(3,1,1);
plot(t(1:341),s4)
title('f0 = 30MHz and sigma = 50ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,2);
plot(t(1:381),s5)
title('f0 = 30MHz and sigma = 100ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,3);
plot(t(1:421), s6)
title('f0 = 30MHz and sigma = 150ns');
xlabel('time (s)');
ylabel('s(t)');

%compute FFT of signals for f0=20MHz and sigma=[50,100,150]ns
S1 = fft(s1);
S2 = fft(s2);
S3 = fft(s3);
%compute FFT of signals for f0=30MHz and sigma=[50,100,150]ns
S4 = fft(s4);
S5 = fft(s5);
S6 = fft(s6);

for i=1:length(t)
    f(i) = 1/t(i);
end

%S(f) = fft(s(t)) for f0=20MHz and sigma=[50,100,150]ns
figure(8);
subplot(3,1,1);
plot(f(1:341),abs(S1))
title('f0 = 20MHz and sigma = 50ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,2);
plot(f(1:381),abs(S2))
title('f0 = 20MHz and sigma = 100ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,3);
plot(f(1:421), abs(S3))
title('f0 = 20MHz and sigma = 150ns');
xlabel('time (s)');
ylabel('s(t)');

%S(f) = fft(s(t)) for f0=30MHz and sigma=[50,100,150]ns
figure(9);
subplot(3,1,1);
plot(f(1:341),abs(S4))
title('f0 = 30MHz and sigma = 50ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,2);
plot(f(1:381),abs(S5))
title('f0 = 30MHz and sigma = 100ns');
xlabel('time (s)');
ylabel('s(t)');
subplot(3,1,3);
plot(f(1:421), abs(S6))
title('f0 = 30MHz and sigma = 150ns');
xlabel('time (s)');
ylabel('s(t)');

%--------------------------------------------------------------------------