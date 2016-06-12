function [ Wave ] = timbre( input_wave , input_src )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   h = hilbert(input_src);
   y = abs(h);
   Wave = zeros(1 , length(input_wave));
   for i = 1 : length(input_wave)
      if i < length(input_src)
        Wave(i) = input_wave(i)*y(i+100,1);
      else
        Wave(i) = input_wave(i)*y(length(input_src),1);
      end
   end
   return ;
end

