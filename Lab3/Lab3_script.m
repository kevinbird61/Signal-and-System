% Lab3 - Do the convolution filter 
Fs = 44100;
% First readin the filter source
[filter , fs_filter] = audioread('IR_Arena_44k.wav');

% sound(y,fs);
filter_t = (1:length(filter))/fs_filter;
subplot(3,1,1);
plot(filter_t , filter , '.');
grid on;
xlabel('T');
ylabel('Sound amplitude');
title('Filter source');

[input , fs_input] = audioread('iron.wav');

% sound(input , fs_input);
input_t = (1:length(input))/fs_input;
subplot(3,1,2);
plot(input_t , input , '.');
grid on;
xlabel('T');
ylabel('Sound amplitude');
title('Input source');

T = (1:length(input)+length(filter)-1)/Fs;
Wave_reuslt = convolution(input,filter);
subplot(3,1,3);
plot(T,Wave_reuslt,'.');
grid on;
xlabel('T');
ylabel('Sound amplitude');
title('Output result');
% Write into audio file
waveResult = 'output.wav';
audiowrite(waveResult , Wave_reuslt , Fs);