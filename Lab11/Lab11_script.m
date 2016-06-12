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
% =======================Change for the Volume ==========================%
C_vol = 10;
G_vol = 80;
% =======================Change for the Vibrato ==========================%
extent = 0.001;
vibrato_rate_c = 1/Tc;
vibrato_rate_g = 1/Tg;
% Build the n-th partial sum of the Fourier series 
Fourier_C = zeros(1,length(Wave_C));
T_C = zeros(1,length(Wave_C));
for i = 1: length(Wave_C)
    Fourier_C(i) = (coef_A(Tc,0,Wave_C)/2);
    for j = 1:n
       Fourier_C(i) = Fourier_C(i)+ coef_A(Tc,j,Wave_C)*cos(j*pi*i/(Tc*0.5*Fs)) + coef_B(Tc,j,Wave_C)*sin(j*pi*i/(Tc*0.5*Fs));
    end
    T_C(i) = (i/Fs);
end
% And Generate the length(Wave_C) ADSR
y = hilbert(Wave_C);
env = abs(y);
Result_C = zeros(length(Wave_C),1);
for i = 1 : length(Wave_C)
    Result_C(i) = C_vol*Fourier_C(i)*env(i);
end
Result_C = vibrato(Result_C,Fs,vibrato_rate_c,extent);
% Plot for debugging
subplot(2,1,1);
plot(T_C,Wave_C,'green');
grid on;
hold on;
plot(T_C,Fourier_C,'red');
hold on;
plot(T_C,Result_C,'blue');
hold on;
plot(T_C,env,'black');
hold on;
legend('Original Wave','Fourier Wave','ADSR Wave(with vibrato)','Env');
title('C tone');
% Build the n-th partial sum of the Fourier series 
flag = 0;
Fourier_G = zeros(1,length(Wave_G));
T_G = zeros(1,length(Wave_G));
for i = 1 : length(Wave_G)
    Fourier_G(i) = (coef_A(Tg,0,Wave_G)/2);
    for j = 1:n
       Fourier_G(i) = Fourier_G(i)+ coef_A(Tg,j,Wave_G)*cos(j*pi*i/(Tg*0.5*Fs)) + coef_B(Tg,j,Wave_G)*sin(j*pi*i/(Tg*0.5*Fs));
    end
    T_G(i) = (i/Fs);
end
% And Generate the length(Wave_C) ADSR
k = hilbert(Wave_G);
env_G = abs(k);
Result_G = zeros(length(Wave_G),1);
for i = 1 : length(Wave_G)
    Result_G(i) = G_vol* Fourier_G(i)*env_G(i);
end
Result_G = vibrato(Result_G , Fs , vibrato_rate_g , extent);
% Plot for debugging
subplot(2,1,2);
plot(T_G,Wave_G,'green');
grid on;
hold on;
plot(T_G,Fourier_G,'red');
hold on;
plot(T_G,Result_G,'blue');
hold on;
plot(T_G,env_G,'black');
legend('Original Wave','Fourier Wave','ADSR Wave(with vibrato)','Env');
title('G tone');