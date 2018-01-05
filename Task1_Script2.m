%{
MPHY3B27 - COMPUTING IN MEDICINE - COURSEWORK
TASK 1 - Plotting the acoustic pressure field as a function of time for a
single point source emission.

Aasim Patel
27/12/17
%}

%position of the source in the source plane
xs=0;
ys=0;
zs=0;

%observation plane
x=1e-3;
y=1e-3;
z=0;

%set parameters
p0=1; %Pascals
c=1500;

%time
dt=1e-8;
t = 0: dt: 3e-6;

%call the function to calculate the pressure field
pressure = comp_press_field_point_source(p0,c,x,y,z,t,dt,xs,ys,zs);

%plot pressure field as a function of time for observation (1,1,0)
figure(1);
plot(t, pressure);
title('Acoustic Pressure');
xlabel('time (seconds)');
ylabel('Pressure (Pa)');