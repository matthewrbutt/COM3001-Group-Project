function create_params

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.H_SPD=2;         %speed of movement - units per itn (healthy human)
    PARAM.I_SPD=2;          %speed of movement - units per itn (infected human)
    PARAM.S_DURATION=120;    %duration of symptoms
    PARAM.I_PERIOD=48;      %incubation period
    
    