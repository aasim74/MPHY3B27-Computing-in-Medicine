%{
TASK 1 SCRIPT
%}

x=0: 0.001: 0.003;
y=0: 0.001: 0.003;
z=0: 0.001: 0.003;

obs = zeros(length(x),length(y));
obs = ndgrid(x,y);
r = zeros(length(x),length(y));

xs=0;
ys=0;
zs=0;

p0=1;
c=1500;
dt=1e-8;
T=3e-6;
t=0:dt:T;

%find tensor r for each value x,y,z;
 for i=1:length(x)
    for j=1:length(y)
            r(i,j) = sqrt(x(i)^2 +y(j)^2);
            r(i,j)=round(r(i,j),5);
    end
 end

 for l=1:length(t)
     if dirac(t(l)-r(2,2)/c)==inf
         p(l) = p0/4*pi*r(2,2);
     else
         p(l)=0;
     end
 end

 
  for i=1:length(x)
    for j=1:length(y)
            r(i,j) = sqrt(x(i)^2 +y(j)^2);
            r(i,j)=round(r(i,j),3);
            for l=1:length(t)
                if dirac(round((t(l)-r(i,j)/c),9))==inf
                    p(l) = p0/4*pi*r(i,j);
                else
                    p(l)=0;
                end
                subplot(4, 1, j);
                plot(t,p)
            end
    end
 end