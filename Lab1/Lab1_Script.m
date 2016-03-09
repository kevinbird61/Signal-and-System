% Calling Square_wave function 
length = 1000;
upper = 2;
lower = 1;
frequency = 1/100;
Percent = 0.43;
sampling_rate = 1/40;

[Wave , T] = Square_wave(upper,lower,frequency,Percent,length,sampling_rate);

plot(T , Wave);
axis([0 length -lower 2*upper]);