% Lab10 script
% For ADSR parameter 
percent_A = 0.1;
percent_D = 0.2;
percent_S = 0.4;
percent_R = 0.3;
% Read for audio source 
Fs = 44100;
Tc = 0.0018;
Tg = 0.0013;
n = 20;
[Wave_C , Fs] = audioread('C.wav');
[Wave_G , Fs] = audioread('G.wav');

% Build the n-th partial sum of the Fourier series 
Fourier_C = zeros(1,length(Wave_C)+1);
T_C = zeros(1,length(Wave_C)+1);
T_C_ori = zeros(1,length(Wave_C));
for i = 1: length(Wave_C)+1
    Fourier_C(i) = (coef_A(Tc,0,Wave_C)/2);
    for j = 1:n
       Fourier_C(i) = Fourier_C(i)+ coef_A(Tc,j,Wave_C)*cos(j*pi*i/(Tc*0.5*Fs)) + coef_B(Tc,j,Wave_C)*sin(j*pi*i/(Tc*0.5*Fs));
    end
    T_C(i) = (i/Fs);
    if i ~= length(Wave_C)+1
        T_C_ori(i) = (i/Fs);
    end
end
% And Generate the length(Wave_C) ADSR
[ADSR_filter_C] = ADSR_generator(percent_A,percent_D,percent_S,percent_R,2,1,length(T_C_ori));
Result_C = zeros(1,length(Wave_C)+1);
for i = 1 : length(Wave_C)+1
    Result_C(i) = Fourier_C(i) * ADSR_filter_C(i);
end
% Plot for debugging
subplot(2,1,1);
plot(T_C_ori,Wave_C,'green');
grid on;
hold on;
plot(T_C,Fourier_C,'red');
hold on;
plot(T_C,Result_C,'blue');
legend('Original Wave','Fourier Wave','ADSR Wave');
title('C tone');
% Build the n-th partial sum of the Fourier series 
Fourier_G = zeros(1,length(Wave_G)+1);
T_G = zeros(1,length(Wave_G)+1);
T_G_ori = zeros(1,length(Wave_G));
for i = 1 : length(Wave_G)+1
    Fourier_G(i) = (coef_A(Tg,0,Wave_G)/2);
    for j = 1:n
       Fourier_G(i) = Fourier_G(i)+ coef_A(Tg,j,Wave_G)*cos(j*pi*i/(Tg*0.5*Fs)) + coef_B(Tg,j,Wave_G)*sin(j*pi*i/(Tg*0.5*Fs));
    end
    T_G(i) = (i/Fs);
    if i ~= length(Wave_G)+1
       T_G_ori(i) = i/Fs; 
    end
end
% And Generate the length(Wave_C) ADSR
[ADSR_filter_G] = ADSR_generator(percent_A,percent_D,percent_S,percent_R,2,1,length(T_G_ori));
Result_G = zeros(1,length(Wave_G)+1);
for i = 1 : length(Wave_G)+1
    Result_G(i) = Fourier_G(i) * ADSR_filter_G(i);
end
% Plot for debugging
subplot(2,1,2);
plot(T_G_ori,Wave_G,'green');
grid on;
hold on;
plot(T_G,Fourier_G,'red');
hold on;
plot(T_G,Result_G,'blue');
legend('Original Wave','Fourier Wave','ADSR Wave');
title('G tone');