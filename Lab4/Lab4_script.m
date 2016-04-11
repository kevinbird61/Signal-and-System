% For Lab4 variable setting
R = 100;
L = 100;
C = 10e-6;
delta_t = 0.001;

F = 100;
F_sin_1 = 100;
F_sin_2 = 1000;
F_sin_3 = 10000;
percent = 0.5;
length = 1;
Fs = 44100;
pi = 3.1415926;
% Build the source signal
[Vs , T] = Square_wave(1 , 0 , F , percent , length , Fs);

Vc_square_source = zeros(1,Fs*length+1);
% Calculate the signal
for i = 1 : Fs*length+1
  Vc_square_source(i) = calculate_foreach_Vc(Vc_square_source , Vs , i , delta_t , R , L ,C);
end

% sin wave (100Hz)
[Vs_sin , T_sin , samplePoints] = create_sin(length,F_sin_1 , pi , delta_t);
Vc_sin_source = zeros(1,samplePoints+1);
for i = 1: samplePoints
  Vc_sin_source(i) = calculate_foreach_Vc(Vc_sin_source , Vs_sin , i , delta_t , R , L ,C);
end

% sin wave (1000Hz)
[Vs_sin2 , T_sin2 , samplePoints] = create_sin(length,F_sin_2 , pi , delta_t);
Vc_sin_source2 = zeros(1,samplePoints+1);
for i = 1: samplePoints
  Vc_sin_source2(i) = calculate_foreach_Vc(Vc_sin_source2 , Vs_sin2 , i , delta_t , R , L ,C);
end

% sin wave (10000Hz)
[Vs_sin3 , T_sin3 , samplePoints] = create_sin(length,F_sin_3, pi , delta_t);
Vc_sin_source3 = zeros(1,samplePoints+1);
for i = 1: samplePoints
  Vc_sin_source3(i) = calculate_foreach_Vc(Vc_sin_source3 , Vs_sin3 , i , delta_t , R , L ,C);
end

subplot(4,1,1);
plot(T , Vc_square_source);
grid on;
xlabel('T');
ylabel('Vc (square source)');
title('Vc with the square source');

subplot(4,1,2);
plot(T_sin / (length*2*pi), Vc_sin_source);
grid on;
xlabel('T (with normalize angle to T)');
ylabel('Vc (sin wave source : F = 100 Hz) ');
title('Vc with the sin wave source');

subplot(4,1,3);
plot(T_sin2 / (length*2*pi)  , Vc_sin_source2);
grid on;
xlabel('T (with normalize angle to T)');
ylabel('Vc (sin wave source : F = 1000 Hz) ');
title('Vc with the sin wave source');

subplot(4,1,4);
plot(T_sin3 / (length*2*pi) , Vc_sin_source3);
grid on;
xlabel('T (with normalize angle to T)');
ylabel('Vc (sin wave source : F = 10000 Hz) ');
title('Vc with the sin wave source');