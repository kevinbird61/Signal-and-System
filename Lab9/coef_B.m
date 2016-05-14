function [ coeffi_B ] = coef_B( T , k , input_signal )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs = 44100;
coeffi_B = 0;
% Calculate Input signal's Bias
Bias = (length(input_signal))/4;

for i = round(Bias) : round(Bias) + round(T*Fs)
    coeffi_B = coeffi_B + input_signal(i)*sin(k*pi*i/(T*Fs/2));
end
    coeffi_B = coeffi_B/(T*Fs/2);
    return ;
end

