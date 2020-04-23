function create_params

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.H_SPD=2;         %speed of movement - units per itn (healthy human)
    PARAM.I_SPD=2;          %speed of movement - units per itn (infected human)
    PARAM.I_MAXAGE=120;    %duration of symptoms
    PARAM.C_MAXAGE=48;      %incubation period
    
    