% define variables
upper = 1;
lower = -1;
F = 100;
percent = 0.8;
length = 1;
Fs = 44100;


[Wave , T] = Square_wave(upper , lower , F , percent , length , Fs);

plot(T , Wave);
axis([0 length*Fs 2*lower 2*upper]);

sound(Wave , Fs);
