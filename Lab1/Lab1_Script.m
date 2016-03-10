% Calling Square_wave function 
length = 100000;
upper = 1;
lower = -1;
frequency = 1/4000;
Percent = 0.43;
sampling_rate = 8000;

[Wave , T] = Square_wave(upper,lower,frequency,Percent,length,sampling_rate);

sound(Wave , sampling_rate);

plot(T , Wave);
axis([0 length 2*lower 2*upper]);