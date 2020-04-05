function [agt, new]=spawn(agt,cn)

%spawning function for class HEALTHY_HUMAN
%agt=healthy_human object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and spawning
%frequency parameters for both infected humans and healthy humans
   
%flim=PARAM.R_FOODBRD;       %minimum food level required for spawning
%tlim=PARAM.R_BRDFQ;         %minimum interval required for spawning
%cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
%last_spawn=agt.last_spawn;  %length of time since agent last reproduced
pos=agt.pos;         %current position

new=infected_human(0,pos,PARAM.F_SPD);   %new infected human agent
