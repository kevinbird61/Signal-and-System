% For Lab7 script
% ============== For control G(s) ==============
M = 1 ; b = -2;
% ============== For control K(s) ==============
Kp = [1 1 1] ; Ki = [1 1 0] ; Kd = [1 0 0];

subplot(2,1,1);
for i = 1 : 3
    % Have been simplied to Zeros/Poles
    Zeros = tf([Kd(i) Kp(i) Ki(i)] , [1]);
    Poles = tf([1] , [(Kd(i)+1) (Kp(i)-2) Ki(i)]);
    sys = feedback(series(Zeros,Poles),1);
    t = 0:0.001:100;
    if i == 1
        step(sys,t , 'blue');
    elseif i == 2
        step(sys,t , 'green');
    elseif i == 3
        step(sys,t , 'red');
    end
    hold on;
    grid on;
end
legend('Blue for PID controller','Green for PI controller','Red for P controller');
title('PID controller with G(s) = 1/(s-2)');

% Change G(s) from 1/(s-2) to 1/(s+1)^2
subplot(2,1,2);
for i = 1 : 3
    % Have been simplied to Zeros/Poles
    Zeros = tf([Kd(i) Kp(i) Ki(i)] , [1 2 1 0]);
    Poles = tf([1 2 1 0] , [1 (Kd(i)+2) (Kp(i)+1) Ki(i)]);
    sys = feedback(series(Zeros,Poles),1);
    t = 0:0.001:100;
    if i == 1
        step(sys,t , 'blue');
    elseif i == 2
        step(sys,t , 'green');
    elseif i == 3
        step(sys,t , 'red');
    end
    hold on;
    grid on;
end
legend('Blue for PID controller','Green for PI controller','Red for P controller');
title('PID controller with G(s) = 1/(s+1)^2');