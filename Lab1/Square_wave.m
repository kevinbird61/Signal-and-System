% Program based on "octave".
function [Wave , T] = Square_wave(upper , lower , F , percent , length , Fs)
 % Initializing
 Period = 1/F;
 sample_point = length * Fs;
 % Return value Initializing
 Wave = zeros(1 , sample_point);
 T = 0:1/Fs:length;
 
 % check the frequency
 if(F > (Fs/2))
  fprintf('Error Frequency ! Frequency must be smaller than Fs/2!\n');
  fprintf('Aliasing!\n'); 
  return;
 else
  fprintf('Frequency is OK!');
 end
 % check the  boundary
 if(lower > upper)
  fprintf('Error ! Your upper bound must be greater than lower bound!\n');
  return;
 else
  fprintf('Boundary check is fine!\n');
 end
 
 % Start calculating
 DutyCycle = Period * percent;
 
 for i = 1 : sample_point+1
  if(mod(T(i),Period) <= DutyCycle)
    Wave(i) = upper;
  else
    Wave(i) = lower;
  end
 end
 
 return;
end