function [ ADSR ] = ADSR_generator( L_A , L_D , L_S , L_R , Amp_A , Amp_S , length )
% L_x : for percentage of length
% Amp_x : for amplitude 
% Assume sample point is from the Fs (44100)
Fs = 44100;
sample_point = Fs*length;
ADSR = zeros(1 , sample_point+1);

point_A = floor(sample_point*L_A);
point_D = floor(sample_point*(L_A+L_D));
point_S = floor(sample_point*(L_A+L_D+L_S));
point_R = floor(sample_point*(L_A+L_D+L_S+L_R));
% Build A
for i = 1 : point_A + 1
   ADSR(i) = (i-1)*(Amp_A)/(sample_point*L_A);
end
% Build D
for i = point_A + 2 : point_D + 1
   ADSR(i) = Amp_A - (i- point_A + 2)*((Amp_A - Amp_S)/(sample_point*L_D)); 
end
% Build S
for i = point_D + 2: point_S + 1
    % Assume it is perfect stable
    ADSR(i) = Amp_S;
end
% Build R
for i = point_S + 2 : point_R + 1
    ADSR(i) = Amp_S - (i -point_S + 2)*(Amp_S/(sample_point*L_R));
end
    return;
end

