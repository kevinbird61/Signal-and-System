% Program based on "octave".
function [Wave , T] = Square_wave(upper , lower , F , percent , length , Fs)
 % Initializing
 Period = 1/F;
 size = length / Period;
 % Return value Initializing
 Wave = 1 : size*F;
 T = 1 : size*F;
 
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
 for i = 1 : size*F
  if(mod(i,size) <= size*percent)
    Wave(i) = upper;
  else
    Wave(i) = lower;
  end
  T(i) = i*Period;
 end
 
 return;
end