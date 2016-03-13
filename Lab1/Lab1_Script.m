% Calling Square_wave function 
% ==============================�ѼƧ��===============================
% Length 100000 ms
length = 100000;
% Setting Upper/Lower Bound 
upper = 2;
lower = -2;
% Setting Period and Frequency
% �g�����קڥHLength����찵�p��A�b�o��H�@��ms�ӥN��@�ӳ��
% �ѩ�T�}�C��index�S��k�ϥΤp���I�A�ҥH��ms�Ӫ�ܧ�p�����
Period = 1/10; % 2000 ms
frequency = 1/Period;
% Setting the Percent, based on Duty cycle
Duty_cycle = 860;
Percent = Duty_cycle/Period;
sampling_rate = 8000;
% ==============================�ѼƧ��===============================

% ==============================�禡�ާ@===============================
[Wave , T] = Square_wave(upper,lower,frequency,Percent,length,sampling_rate);
%���X�n��
sound(Wave , sampling_rate);
%���X�ϧ�
plot(T , Wave);
axis([0 length/1000 2*lower 2*upper]);