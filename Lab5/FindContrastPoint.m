function [ Wave ] = FindContrastPoint( Fs , length , Wave1 , Wave2 )
samplePoint = Fs * length;
Wave = zeros(1 , samplePoint+1);

for i = 1 : samplePoint+1
    % if two wave of this point are contrast , set this point to 1 as new
    % wave
    if Wave1(i) + Wave2(i) == 0 
        Wave(i) = 1;
    end
end
    % Because T are the same , so I didn't set the T 
    return;
end

