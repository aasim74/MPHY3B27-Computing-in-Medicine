function [ P ] = press_field_3D(p0,c,xs,ys,t,dt,x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%observation plane
[X,Y] = ndgrid(x,y); %created a matrix of X and Y values
X=X'; Y=Y'; %We want x values to increase along each row and y along each column

%source plane
XS = double(xs*ones(length(x),length(y))); %Point source
YS = double(ys*ones(length(x),length(y)));

R = sqrt((X-XS).^2+(Y-YS).^2);
T=R/c;
T=round(T,8);
fprintf('Done R Matrix\n')

%preallocate pressure field matrix P
P=zeros(length(x),length(y),length(t));

%temporal loop
for l=int16(1):int16(length(t))
    %spatial loop
    for i=int16(1):int16(length(x))
        for j=int16(1):int16(length(y))
            if t(l)==T(i,j) %if t=r/c then dirac(t-r/c)==inf
                P(i,j,l)=p0/(4*pi*R(i,j));
            else
                P(i,j,l)=0;
            end
        end
    end
    fprintf('Time Done: %d / %d\n',l,length(t))
end

fprintf('Pressure Matrix Obtained. Size of the Matrix is: %d %d %d\n', size(P))

end
