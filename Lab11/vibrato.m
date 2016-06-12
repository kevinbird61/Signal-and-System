function [ output ] = vibrato( input , Fs , vibrato_rate , extent )
Delay = extent;
DELAY = round(Delay*Fs);
WIDTH = round(extent*Fs);

if WIDTH > DELAY
   error('delay greater than basic delay'); 
   return;
end

MODFREQ = vibrato_rate / Fs;
LEN = length(input);
L = 2 + DELAY + WIDTH*2;
Delayline = zeros(L,1);
output = zeros(size(input));
for n = 1: (LEN-1)
   M = MODFREQ;
   MOD = sin(M*2*pi*n);
   TAP = 1 + DELAY + WIDTH * MOD;
   i = floor(TAP);
   frac = TAP -i;
   Delayline = [input(n);Delayline(1:L-1)];
   % Linear Interpolation
   output(n,1) = Delayline(i+1)*frac + Delayline(i)*(1-frac);
end

end

