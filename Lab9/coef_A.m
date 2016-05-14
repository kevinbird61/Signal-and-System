function [ coeffi_A ] = coef_A( T , k , input_signal )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs = 44100;
coeffi_A = 0;
% Calculate Input signal's Bias
Bias = (length(input_signal))/4;

for i = round(Bias) : round(Bias) + round(T*Fs)
    coeffi_A = coeffi_A + input_signal(i)*cos(k*pi*i/(T*Fs/2));
end
    coeffi_A = coeffi_A/(T*Fs/2);
    return ;
end

