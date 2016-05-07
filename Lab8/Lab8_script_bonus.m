% For Lab8 script 
Fs = 44100;
Upper_threshold = 0.1;
Lower_threshold = -0.0;

[inputSrc , Fs] = audioread('clean tone.wav');
%sound(inputSrc,Fs);
subplot(2,1,1);
plot(inputSrc);
for i = 1 : size(inputSrc,1)
    for j = 1 : size(inputSrc,2)
        if inputSrc(i,j) > Upper_threshold
           inputSrc(i,j) = Upper_threshold; 
        elseif inputSrc(i,j) < Lower_threshold
           inputSrc(i,j) = Lower_threshold;
        end
    end 
end
%pause(6);
sound(inputSrc,Fs);
subplot(2,1,2);
plot(inputSrc);