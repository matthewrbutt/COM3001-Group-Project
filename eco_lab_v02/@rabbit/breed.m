function [agt, new]=breed(agt,cn)

%breeding function for class RABBIT
%agt=rabbit object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits
   
%flim=PARAM.R_FOODBRD;       %minimum food level required for breeding
%tlim=PARAM.R_BRDFQ;         %minimum interval required for breeding
%cfood=agt.food;              %get current agent food level
age=agt.age;                %get current agent age
%last_breed=agt.last_breed;  %length of time since agent last reproduced
pos=agt.pos;         %current position

new=fox(0,pos,PARAM.F_SPD);   %new fox agent
