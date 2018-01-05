%{
MPHY3B27 - COMPUTING IN MEDICINE - COURSEWORK
TASK 2 - Gaussian Pressure

Aasim Patel
27/12/17
%}

%constants and arrays
sigma = 50e-9;
sigma_array = -4*sigma : sigma: 4*sigma;
t= -4*sigma: 1e-8: 4*sigma;
dt = 1e-8;
size(t)
f0 = 10e6;

%using the Gaussian function to calculate the Gaussian pressure
Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);

%Plot
figure(1);
plot(t,Gauss_press)
title('Gaussian Tone Burst');
xlabel('time (s)');
ylabel('Pressure (Pa)');