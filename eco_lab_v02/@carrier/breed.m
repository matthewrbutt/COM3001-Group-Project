function [agt,new]=breed(agt,cn)

%breeding function for class FOX
%agt=fox object
%cn - current agent number
%new - contains new  agent object if created, otherwise empty

global PARAM IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and breeding
%frequency parameters for both foxes and rabbits

age=agt.age;                %get current agent age
pos=agt.pos;                %current position

if age>=PARAM.C_MAXAGE  %if age > max_age then create offspring
   new=rabbit(0,pos,PARAM.F_SPD,0);   %new carrier agent
   agt.age=age+1;
   IT_STATS.div_f(N_IT+1)=IT_STATS.div_f(N_IT+1)+1;             %update statistics
else                            
    new=[];
end