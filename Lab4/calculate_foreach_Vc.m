function [V] = calculate_foreach_Vc(Vc , Vs , t , delta_t , R , L ,C)
    % Variable define
    Vc_delta_one_coef = 2*R*L*C + L*delta_t;
    Vc_delta_two_coef = -R*L*C;
    Vs_delta_one_coef = -L*delta_t;
    Vs_coef = L*delta_t;
    Denominator = R*L*C + R*(delta_t)*(delta_t)+L*delta_t;
    % calculate Vc(t)
    if((t - (2*delta_t)) < 0 && t == 0)
      % can't calculate for Vc
      % at starting point
      V = 0;%Vs_coef*Vs(t) / Denominator;
    elseif(t == 1)
      % at starting point 2
      V = 0;%Vs_coef*Vs(t) / Denominator;
    else
      % can calculate the delta with differential equation
      each_interval = (Vc(t) - Vc(t-1)) * delta_t; % retrieve each interval
      each_interval_Vs = (Vs(t) - Vs(t-1)) * delta_t; % retrieve each for Vs
      Vc_delta_one = Vc(t) - each_interval;
      Vc_delta_two = Vc(t) - each_interval*2;
      Vs_delta_one = Vs(t) - each_interval_Vs*delta_t;
      % using the result by hand calculate from orginial circuit(reduced by Kirchhoff Circuit Laws with Laplace)
      V = (Vc_delta_one_coef*Vc_delta_one + Vc_delta_two_coef*Vc_delta_two + Vs_delta_one_coef*Vs_delta_one + Vs_coef*Vs(t))/ Denominator;
    end
    return;
end