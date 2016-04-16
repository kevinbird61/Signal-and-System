function [ Wave , T ] = Create_sin( F , Fs , length )
% For samnple point
pi = 3.1415926;
sample_point = Fs*length;
each_wave_size = Fs / F;
Wave = zeros(1 , sample_point+1);
T = 0 : length / sample_point : length;

for i = 1 : sample_point +1
    % For each wave's location
    location = mod(i , each_wave_size);
    Wave(i) = sin(location * ((2*pi) / each_wave_size));
end
    return;
end

