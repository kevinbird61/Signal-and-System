%%% For Lab12 , read the simple rhythm
%%% Variable
everyLeng = 0.2; % as 0.5s
%%%
buffer = fileread('sample.txt');
[Timbre_source , F ] = audioread('C.wav');
count = 0;
Alphabet = char(1,1);
leng = zeros(1,1);
for i = 1:length(buffer)
   if buffer(i) == '|'
       % do nothing 
   else
       % start to translate to sound
       count = count + 1;
       if buffer(i) ~= '-'
           leng(count) = 1;
           Alphabet(count) = buffer(i);
       else
           % find the above , whether leng(i-) ~= 0
           leng(count) = 0;
           Alphabet(count) = '0';
           index = count;
           while 1
               if index == 1 || leng(index) ~= 0
                    leng(index) = leng(index)+1;
                    break;
               end
               index = index-1;
           end
       end
   end
end

% And now we get the value of Alphabet and it's length
% for i = 1 : length(Alphabet)
%    fprintf('%s , %d\n',Alphabet(i),leng(i));
% end

for i = 1 : count
    % Do the correspond Sound and length
    play_sound(Alphabet(i),leng(i)*everyLeng , everyLeng , Timbre_source);
end
