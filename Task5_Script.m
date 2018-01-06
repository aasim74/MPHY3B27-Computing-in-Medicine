%{
%==========================================================================
MPHY3B27 - COMPUTING IN MEDICINE
Task 5

Aasim Patel 
06/01/2018
%==========================================================================
%}

%source plane
xs=0;
ys=0;
zs=0;

%observation plane
x = -3e-3: 10e-6: 3e-3;
y = -3e-3: 10e-6: 3e-3;
z = 0;

[X,Y] = ndgrid(x,y);

%time
dt = 1e-8;
t = 0: dt: 3e-6;

p0 = 1;
c = 1500;

f0 = 10e6;
sigma = 50e-9;

%pressure = comp_press_field_point_source(p0,c,x,y,z,t,dt,xs,ys,zs);

%Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);

%% Get Pressure Matrix
%for all all time increments loop
r = zeros(100);
for l=1:length(t)
    %spatial loop
    for i=1:length(x)
        for j=1:length(y)
                r(i,j) = sqrt((x(i)-xs)^2+(y(j)-ys)^2);
                %fprintf('Done X: %d / %d\n',j,length(y))
                r(i,j)=round(r(i,j),5);
                if dirac(t(l)-r(i,j)/c)==inf
                    p(i,j,l)=p0/(4*pi*r(i,j));
                else
                    p(i,j,l)=0;
                end
        end
        %fprintf('Done Y: %d / %d\n',i,length(x))
    end
%end spatial loops
fprintf('Time Elements Done: %d / %d\n',l,length(t))
end



%% Gaussian
f0=10e6;
sigma=50e-9;
dt=1e-8;

Gauss_press = comp_Gaussian_tone_burst(f0,sigma,dt);
    
s=conv2(p(:,:,101),Gauss_press);

%% Plot Pressure

fh1 = figure(1);
colormap(hot);
sp1 = subplot(1,2,1);
set(fh1, 'Name', '2D Plot of pressure at given Time t');
imagesc(x,y,p(:,:,101))
title('Point Pressure');
xlabel('x');
ylabel('y');
sp2 = subplot(1,2,2);
imagesc(x,y,s)
title('Convoluted Signal s(t)');
xlabel('x');
ylabel('y');

