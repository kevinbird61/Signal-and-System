% do the convolution function
function [ Wave ] = convolution(Wave_input,Wave_filter)
  % Get the wave length 
  length_1 = length(Wave_input);
  length_2 = length(Wave_filter);
  % Make the Conv result matrix 
  Wave = zeros(1,length_1+length_2-1);
  % using for loop to get the convoultion result
  for i = 1 : length_1
    for j = i : i+length_2-1
      index = j - i + 1;
      Wave(j) += (Wave_input(i) * Wave_filter(index));
    end  
  end
  return;
end