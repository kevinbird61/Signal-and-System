# Calculate RC circuit
Fs = 44100;
percent = 0.5;
upper = 1;
lower = -1;
length = 1;
F = 10;
R = 100;
C1 = 10e-7;
C2 = 10e-6;
C3 = 10e-5;
C4 = 10e-4;

[Wave, T] = Square_wave(upper,lower, F, percent, length, Fs);
RC_circuit = zeros(1, Fs/F);
for i = 1:Fs/F
    RC_circuit1(i) = 1/(R*C1) * exp(-T(i*F)/(R*C1));
end

Vc_t1 = conv(Wave, RC_circuit1/sum(RC_circuit1), 'same');

figure
subplot(4,1,1);
plot(T,Vc_t1,'.');
grid on;
xlabel('T');
ylabel('Vc');
title('C = 1uF');

RC_circuit2 = zeros(1, Fs/F);
for i = 1:Fs/F
    RC_circuit2(i) = 1/(R*C2) * exp(-T(i*F)/(R*C2));
end

Vc_t2 = conv(Wave, RC_circuit2/sum(RC_circuit2), 'same');

subplot(4,1,2);
plot(T,Vc_t2,'.');
grid on;
xlabel('T');
ylabel('Vc');
title('C = 10uF');

RC_circuit3 = zeros(1, Fs/F);
for i = 1:Fs/F
    RC_circuit3(i) = 1/(R*C3) * exp(-T(i*F)/(R*C3));
end

Vc_t3 = conv(Wave, RC_circuit3 /sum(RC_circuit3), 'same');

subplot(4,1,3);
plot(T,Vc_t3,'.');
grid on;
xlabel('T');
ylabel('Vc');
title('C = 100uF');

RC_circuit4 = zeros(1, Fs/F);
for i = 1:Fs/F
    RC_circuit4(i) = 1/(R*C4) * exp(-T(i*F)/(R*C4));
end

Vc_t4 = conv(Wave, RC_circuit4/sum(RC_circuit4), 'same');

subplot(4,1,4);
plot(T,Vc_t4,'.');
grid on;
xlabel('T');
ylabel('Vc');
title('C = 1000uF');
% axis([-inf , inf , -5 , 5]);