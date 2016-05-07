function [ result ] = Sum_2_Wave( Wave1 , Wave2 , samplePoint , pow)
% For summation of 2 wave
% With Normalize to -1~1
result = zeros(1 , samplePoint+1);
for i = 1 : samplePoint+1
   % Using decreasing summation : 
   result(i) = Wave1(i) + power(0.5,pow)*Wave2(i);
   %result(i) = Wave1(i) + Wave2(i);
end
    return;
end

