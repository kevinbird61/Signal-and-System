% For Lab6 script
% Setting Variable ============= ADSR =============
percent_A = 0.1;
percent_D = 0.2;
percent_S = 0.4;
percent_R = 0.3;
Amp_A = 2;
Amp_S = 1;
length = 1;
% Setting Variable ============= cosine =============
n = 7;
F = 50; % e.g. omega
Fs = 44100;
samplePoint = Fs*length;
% Create ADSR
[filter] = ADSR_generator(percent_A,percent_D,percent_S,percent_R,Amp_A,Amp_S,length);
% Create cosine wave
cosine_sum_result = zeros(1 , samplePoint+1);
for i = 1 : n
   [cosine , T] = Create_cos(n , Amp_A , F , Fs , length);
   [cosine_sum_result] = Sum_2_Wave(cosine_sum_result , cosine , samplePoint);
end
% Calculate the final result
% Using Summation (For totally sum ADSR)
[total] = Sum_2_Wave(cosine_sum_result , filter , samplePoint);
% Test if we use multiply
total_mul = zeros(1,samplePoint+1);
for i = 1 : samplePoint+1
    total_mul(i) = cosine_sum_result(i) * filter(i);
end

% Now test if we apply ADSR on each period of source wave
each_wave = Fs/F;
for i = 1 : samplePoint
   judge_point = mod(i , each_wave); % Every period has Fs/F point
   if judge_point <= (each_wave*percent_A)
       cosine_sum_result(i) = cosine_sum_result(i) + Amp_A*(judge_point/(each_wave*percent_A));
   end
   if judge_point > (each_wave*percent_A) && judge_point <= (each_wave*(percent_A+percent_D))
       cosine_sum_result(i) = cosine_sum_result(i) + (Amp_A - (Amp_A - Amp_S)*(judge_point/(each_wave*percent_D)));
   end
   if judge_point > (each_wave*(percent_A+percent_D)) && judge_point <= (each_wave*(percent_A+percent_D+percent_S))
       cosine_sum_result(i) = cosine_sum_result(i) + Amp_S;
   end
   if judge_point > (each_wave*(percent_A+percent_D+percent_S)) && judge_point <= (each_wave*(percent_A+percent_D+percent_S+percent_R))
       cosine_sum_result(i) = cosine_sum_result(i) + Amp_S*(judge_point/(each_wave*percent_R));
   end
end

subplot(3,1,1);
plot(T,total);
xlabel('T');
ylabel('Amp');
title('ADSR with total source wave(Summation)');
sound(total , Fs);
pause(2*length);
% For judging where ADSR should apply
subplot(3,1,2);
plot(T,cosine_sum_result);
xlabel('T');
ylabel('Amp');
title('ADSR with each period source wave');
sound(cosine_sum_result , Fs);
pause(2*length);
% For using result which is multiply with ADSR, not using summation
subplot(3,1,3);
plot(T,total_mul);
xlabel('T');
ylabel('Amp');
title('ADSR with total source wave(multiplication)');
sound(total_mul , Fs);