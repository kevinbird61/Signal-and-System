% For Lab5 script
% Define for frequency range  
upper  = 150;
lower = 50;
interval = 10;
F_range = lower : interval : upper;
% Define for variable
Fs = 44100;
Fx = 100;
length = 0.5;
% Create x - sin wave with frequency is 100Hz
[Wave_x , Tx] = Create_sin(Fx , Fs , length);
% Create for another sin wave
while(1)
    for i = 1 : ((upper-lower)/interval)+1
       % Calculate
       [Wave_sum , Ts] = Create_sin(F_range(i) , Fs , length);
       [Wave_contrast] = FindContrastPoint( Fs , length , Wave_x , Wave_sum );
       % plot the figure
       subplot(3,1,1);
       plot(Tx , Wave_x + Wave_sum , '.');
       sum_string = strcat('F =',int2str(F_range(i)),' Hz ');
       legend(sum_string);
       grid on;
       title('Sum result');
       xlabel('Time');
       ylabel('sin(x)');
       % ================= for original plot =================
       subplot(3,1,2);
       plot(Tx , Wave_x ,'*', Ts , Wave_sum , '.');
       legend('Original Wave(100Hz)' , 'Sum result');
       grid on;
       title('Source wave');
       xlabel('Time');
       ylabel('sin(x)');
       % ================= forcontrast point plot =================
       subplot(3,1,3);
       plot( Tx , Wave_contrast , '*');
       legend('Contrast Point');
       axis([0 length 0 1.5]);
       grid on;
       title('Contrast Wave');
       xlabel('Time');
       ylabel('sin(x)');
       sound(Wave_sum , Fs);
       pause(1);
    end
end