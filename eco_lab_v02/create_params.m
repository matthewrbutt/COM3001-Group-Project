function create_params

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.R_SPD=2;         %speed of movement - units per itn (healthy human)
    PARAM.F_SPD=2;          %speed of movement - units per itn (infected human)
    PARAM.R_MAXAGE=10000;   %maximum agent age allowed 
    PARAM.F_MAXAGE=normrnd(120,48);    %duration of symptoms (mean = 5 days, s.d. = 2 days)
    PARAM.C_MAXAGE=normrnd(48,24);      %incubation period (mean = 2 days, s.d. = 1 day)
    
    