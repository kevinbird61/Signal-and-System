function [ result ] = Sum_2_Wave( Wave1 , Wave2 , samplePoint )
% For summation of 2 wave
result = zeros(1 , samplePoint);
for i = 1 : samplePoint
   result(i) = Wave1(i) + Wave2(i);
end
    return;
end

