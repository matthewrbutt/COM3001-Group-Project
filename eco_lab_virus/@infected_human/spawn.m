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

age=agt.age;                %get current agent age
pos=agt.pos;                %current position

if age>=PARAM.I_PERIOD+PARAM.S_DURATION  %if age > duration of infection then healthy human is spawned
   new=healthy_human(0,pos,PARAM.H_SPD,0,1);   %new healthy_human agent
   agt.age=age+1;
   IT_STATS.div_h(N_IT+1)=IT_STATS.div_h(N_IT+1)+1;             %update statistics
else                            
    new=[];
end