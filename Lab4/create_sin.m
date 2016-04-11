function [Wave , T , samplePoint] = create_sin(length , F , pi , delta_t)
  %pi = 3.1415926;
  T = 0: delta_t : length*2*pi;
  Wave = sin(F*T);
  samplePoint = round( (length*2*pi) / delta_t );
  return 
end