%function [Wave , T] = Square_wave( upper , lower , F ,Percent , length ,
%Fs) => 輸出
function [Wave , T] = Square_wave( upper , lower , F , Percent , length , Fs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   ============== input ==============
%   amplitude : upper / lower
%   F : frequency => 1 / T ; length : 整段測資的範圍 ; Fs : sampling rate
%   Percent : Duty cycle / Period(T) => 0~1
%   ============== output ==============
%   Wave : 每個點的值  (matrix)
%   T : 每個點的時間點 (matrix)

    Wave = 1:length;
    T = 1:length;
    Period = 1 / F; % get the period
    %Duty_cycle = (Percent * Period)/100;
    % =============== Check the frequency ===============
    if(F > (Fs/2))
       fprintf('Error Frequency ! Frequency must be smaller than Fs/2 !\n');
       return;
    else
       fprintf('Aliasing !\n');
    end
    % =============== Check the boundary ===============
    if(lower > upper)
       fprintf('Error ! Your Upper bound must greater than lower bound!\n'); 
       return;
    end
    % ============== Start Plotting ==============
    Duty_point = length / Period;
    for i = 1 : Duty_point
        for j = 1+(i-1)*Period : i*Period
           %  
           point = (i-1)*Period + Period*(Percent);
           if(j < (point))
               Wave(j) = upper;
           else
               Wave(j) = lower;               
           end
        end
    end
    
    % Plot the Figure (signal)
    return;
    %plot(X,Y);
    %axis([0 length -lower 2*upper]);
    
end

