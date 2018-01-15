function [ P ] = press_field_4D(xs,a)
%PRESSURE FIELD 4D - Computes the pressure field in 4D
%   This function is used for Task 6

%observation plane
x = double(-3e-3: 10e-6: 3e-3);
y = double(-3e-3: 10e-6: 3e-3);
z = double(0);
[X,Y] = ndgrid(x,y); %created a matrix of X and Y values
X=X'; Y=Y'; %We want x values to increase along each row and y along each column

%source plane
XS = double(xs(a)*ones(length(x),length(y))); %Point source
YS = double(zeros(length(x),length(y)));
%time
dt = double(1e-8);
t = double(0: dt: 3e-6);

p0 = 1;
c = 1500;
R = sqrt((X-XS).^2+(Y-YS).^2);
T=R/c;
T=round(T,8);
%fprintf('Done R Matrix\n')

%preallocate pressure field matrix P
P=zeros(length(x),length(y),length(t));

%temporal loop
for l=int16(1):int16(length(t))
    %spatial loop
    for i=int16(1):int16(length(x))
        for j=int16(1):int16(length(y))
            %if dirac(t(l)-R(i,j)/c)==inf
            if t(l)==T(i,j)
                P(i,j,l)=p0/(4*pi*R(i,j));
            else
                P(i,j,l)=0;
            end
        end
    end
    %fprintf('Time Done: %d / %d\n',l,length(t))
end

fprintf('Pressure Matrix Obtained. Size of the Matrix is: %d %d %d\n', size(P))

end

