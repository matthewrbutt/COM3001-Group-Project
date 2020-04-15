function create_params

%set up spawning, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.R_SPD=10;         %speed of movement - units per itn (healthy human)
    PARAM.F_SPD=10;          %speed of movement - units per itn (infected human)
    PARAM.R_MAXAGE=10000;   %maximum age allowed 
    PARAM.F_MAXAGE=336;     %duration of infection
    PARAM.C_MAXAGE=72;      %incubation period
    
    