% For Lab8 script 
Fs = 44100;
F = 100;
length = 1;
bias = 1;
Upper_threshold = 0.3;
Lower_threshold = -0.3;
% Build Harmonical sine wave

Wave_to_sum = zeros(1,Fs*length+1);
for i = 1 : 2 : 97
    [Wave_sin , T] = Create_sin(i*F , Fs , length);
    subplot(2,1,1);
    hold on;
    grid on;
    plot(T,Wave_sin);
    [Wave_to_sum] = Sum_2_Wave(Wave_to_sum,Wave_sin,Fs*length , i);
    %sound(Wave_to_sum,Fs);
    %pause(length/5);
end
pause(length);
sound(Wave_to_sum,Fs);
subplot(2,1,2);
hold on;
grid on;
plot(T,Wave_to_sum);
pause(length);