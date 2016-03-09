function testPlot( x , temp )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   x : end point ; temp : space between each point
    y =  1 : x ;
    k =  1 : x ;
    for i = 1:x
       if( mod(i-1,temp) == 0)
          y(i) = 1; 
       else
          y(i) = 0;
       end
    end
    plot(k,y);
end

