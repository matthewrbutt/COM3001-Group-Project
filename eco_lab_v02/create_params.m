function create_params

%set up breeding, migration and starvation threshold parameters. These
%are all completely made up!

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

global PARAM

    PARAM.R_SPD=10;         %speed of movement - units per itn (rabbit)
    PARAM.F_SPD=0;         %speed of movement - units per itn (fox)
    PARAM.R_MAXAGE=10000;      %maximum age allowed 
    PARAM.F_MAXAGE=336;
    
    