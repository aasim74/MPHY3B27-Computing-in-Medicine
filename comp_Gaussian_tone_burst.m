function [ Gauss_press ] = comp_Gaussian_tone_burst(f0, sigma, dt)
%Calculates the Gaussian Pressure
%   Detailed explanation goes here
%Gauss_press = zeros(length(t));
t = -4*sigma: dt: 4*sigma;

for a=1:length(t)
        Gauss_press(a) = exp(-(t(a)^2)/(2*sigma^2))*sin(2*pi*f0*t(a));
end

end

