function [] = play_sound( tone , leng , delay , timbre_src )
    Fs = 44100;
    sample_point = Fs*leng;
    Wave = zeros(1 , sample_point+1);
    switch tone
        case '1'
            % do , C4 : 261.63
            [Wave , T] = Create_sin(262 , Fs , leng);
        case '2'
            % re , D4 : 293.66
            [Wave , T] = Create_sin(294 , Fs , leng);
        case '3'
            % mi , E4 : 329.63
            [Wave , T] = Create_sin(330 , Fs , leng);
        case '4'
            % fa , F4 : 349.23
            [Wave , T] = Create_sin(349 , Fs , leng);
        case '5' 
            % so , G4 : 392.00
            [Wave , T] = Create_sin(392 , Fs , leng);
        case '6'
            % si , A4 : 440.00
            [Wave , T] = Create_sin(440 , Fs , leng);
        case '7' 
            % do , B4 : 493.88
            [Wave , T] = Create_sin(494 , Fs , leng);
        case '0'
            % do nothing
        otherwise
            warning('Warning Message: Error with your sample.txt')
    end
    % composite with violin's Timbre
    [Wave] = timbre(Wave ,timbre_src);
    % paly the sound
    sound(Wave,Fs);
    % make the right delay
    pause(leng + delay);
end

