% For Lab9 script
Fs = 44100;
n = 10;
% Read from sawtooth.wav
[saw , Fs] = audioread('sawtooth.wav');
% Build the n-th partial sum of the Fourier series 
FS_Saw = zeros(1 , length(saw));
T = zeros(1,length(saw));
for i = 1 : length(saw)
    FS_Saw(i) =  (coef_A(0.02 , 0 , saw)/2); 
    for j = 1 : n
        FS_Saw(i) = FS_Saw(i) + coef_A(0.02 , j ,saw)*cos(j*pi*i/(0.01*Fs)) + coef_B(0.02 , j ,saw)*sin(j*pi*i/(0.01*Fs)) ;
    end 
    T(i) = (i/Fs);
end
subplot(2,1,1);
plot(T,saw , 'black');
grid on;
hold on;
plot(T,FS_Saw , 'red');
legend('sawtooth (source)' , 'sawtooth (Fourier Series)');
% Next , calculate for violin
% Read from violin.wav
[violin , Fs] = audioread('violin.wav');
FS_Vio = zeros(1 , length(violin));
T2 = zeros(1,length(violin));
for i = 1 : length(violin)
    FS_Vio(i) =  (coef_A(0.0005 , 0 , violin)/2); 
    for j = 1 : n
        FS_Vio(i) = FS_Vio(i) + coef_A(0.0005 , j ,violin)*cos(j*pi*i/(0.00025*Fs)) + coef_B(0.0005 , j ,violin)*sin(j*pi*i/(0.00025*Fs)) ;
    end 
    T2(i) = (i/Fs);
end
subplot(2,1,2);
plot(T2 , violin , 'black');
grid on;
hold on;
plot(T2,FS_Vio , 'red');
legend('violin (source)' , 'violin (Fourier Series)');
axis([0 , 5 , -1 , 1]);