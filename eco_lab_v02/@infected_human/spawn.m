function [agt,new]=spawn(agt,cn)

%spawning function for class INFECTED_HUMAN
%agt=infected_human object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and spawning
%frequency parameters for both infected humans and healthy humans

   
%flim=PARAM.F_FOODBRD;       %minimum food level required for spawning
%tlim=PARAM.F_BRDFQ;         %minimum interval required for spawning
%cfood=agt.food;             %get current agent food level
age=agt.age;                %get current agent age
%last_spawn=agt.last_spawn;  %length of time since agent last reproduced
pos=agt.pos;                %current position

if age>=PARAM.F_MAXAGE  %if age > max_age then healthy human is spawned
   new=healthy_human(0,pos,PARAM.R_SPD,0,1);   %new healthy_human agent
%  agt.food=cfood/2; %divide food level between 2 agents
%  agt.last_spawn=0;
   agt.age=age+1;
   IT_STATS.div_f(N_IT+1)=IT_STATS.div_f(N_IT+1)+1;             %update statistics
else                            
%   agt.last_spawn=last_spawn+1;
    new=[];
end