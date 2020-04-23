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
   
pos=agt.pos;         %current position

x=rand;             %agent has a 16% chance of becoming an asymptotic carrier

if x<0.16
    asymp=1;
else
    asymp=0;
end

IT_STATS.div_i(N_IT+1)=IT_STATS.div_i(N_IT+1)+1 %update stats
new=infected_human(0,pos,PARAM.I_SPD,asymp);   %new infected human agent
