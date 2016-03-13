% Calling Square_wave function 
% ==============================參數改動===============================
% Length 100000 ms
length = 100000;
% Setting Upper/Lower Bound 
upper = 2;
lower = -2;
% Setting Period and Frequency
% 週期長度我以Length的單位做計算，在這邊以一個ms來代表一個單位
% 由於T陣列的index沒辦法使用小數點，所以用ms來表示更小的單位
Period = 1/10; % 2000 ms
frequency = 1/Period;
% Setting the Percent, based on Duty cycle
Duty_cycle = 860;
Percent = Duty_cycle/Period;
sampling_rate = 8000;
% ==============================參數改動===============================

% ==============================函式操作===============================
[Wave , T] = Square_wave(upper,lower,frequency,Percent,length,sampling_rate);
%撥出聲音
sound(Wave , sampling_rate);
%劃出圖形
plot(T , Wave);
axis([0 length/1000 2*lower 2*upper]);