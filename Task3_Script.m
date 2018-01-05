
%{
MPHY3B27 - COMPUTING IN MEDICINE - COURSEWORK
TASK 1 - Plotting the acoustic pressure field as a function of time for a
single point source emission.

Aasim Patel
27/12/17
%}

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
t=0:dt:3e-6;

%call the function to calculate the pressure field
pressure = comp_press_field_point_source(p0,c,x,y,z,t,dt,xs,ys,zs);

figure(1);
plot(t,pressure);
title('Pressure');
xlabel('Time (secs)');
ylabel('Pressure (Pa)');

%constants and arrays
sigma = 50e-9;
sigma_array = -4*sigma : sigma: 4*sigma;
t= -4*sigma: 1e-8: 4*sigma;
dt=1e-8;
f0 = 10e6;

%call Gaussian tone burst function
Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);

figure(2);
plot(t,Gauss_press);
title('Gaussian Tone Burst');
xlabel('Time (secs)');
ylabel('Pressure (Pa)');

%Convolution of the pressure and Gaussian Tone Burst
%s = conv(pressure(72:112), Gauss_press(:,1));
s = conv(pressure, Gauss_press);

t = linspace(0,3e-6,341);
tp = 0:dt:3e-6;

figure(3);
plot(t,s,tp,pressure);
%plot(t,s,t,pressure(40:120));
title('Convoluted');