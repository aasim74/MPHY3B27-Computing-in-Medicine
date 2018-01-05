%{
MPHY3B27 - COMPUTING IN MEDICINE

comp_press_field_point_source
Computes the pressure field of a point source placed at a position
(xs,ys,zs) in the source plane and a sharp pressure peak detected at time
t-r/c for a propagation distance r. Takes in initial pressure p0,
obsevation plane coordinates (x,y,z), time t and element dt, and source
coordinates (xs,ys,zs) as input parameters.

Computes the pressure field as a function of time.

Aasim Patel
27/12/17
%}

function [pressure] = comp_press_field_point_source(p0,c,x,y,z,t,dt,xs,ys,zs)

%for all all time increments loop
for l=1:length(t)
    %spatial loop
    for i=1:length(x)
        for j=1:length(y)
            for k=1:length(z)
                r = sqrt((x(i)-xs(i))^2+(y(j)-ys(j))^2+(z(k)-zs(k)));
                r=round(r,5);
                if dirac(t(l)-r/c)==inf
                    p(l)=p0/(4*pi*r);
                else
                    p(l)=0;
                end
            end
        end
    end
%end spatial loops
fprintf('Time Elements Done: %d / %d\n',l,length(t))
end
%end time loop


pressure = p;
%fprintf('the array r: %d\n',r);
%plot(t,p);
end


%{
function pressure = comp_press_field_point_source(p0,c,X,Y,Z, T,dt, x_s,y_s,z_s)
pressure=zeros(1000,5);
    for t=0:dt:T
        for x=0:0.001:X
            for y=0:0.001:Y
                for z=0:0.001:Z
                r = sqrt((x-x_s)^2 + (y-y_s)^2 + (z-z_s)^2);
                R = round(r,5);
                if dirac(t-r/c)==inf
                    p = p0 * (dirac(t-R/c)/4*pi*R);
                    pressure = [p,x,y,z,t; pressure];
                else
                    p=0;
                    pressure = [p,x,y,z,t; pressure];
                end
                end
            end
        end
    end
end
%}