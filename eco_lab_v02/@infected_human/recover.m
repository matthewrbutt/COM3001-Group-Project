function [agt,recovered]=recover(agt,cn)

%recover function for class infected human
%agt=infected human object
%cn - current agent number
%recovered=1 if agent recovers, =0 otherwise

%infected humans recover if they are older than max_age (infection is over)

global PARAM IT_STATS N_IT MESSAGES

%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and spawning
%frequency parameters for both infected humans and healthy humans
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=healthy human, 2-infected human, 3=recovered agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGES.dead - n x1 array containing ones for agents that have
   %    despawned
   %    in the current iteration

   
recovered=0;
age=agt.age;                %get current agent age

if age>=PARAM.F_MAXAGE      %if age > max age then agent recovers
  IT_STATS.died_i(N_IT+1)=IT_STATS.died_i(N_IT+1)+1;  %update statistics
  MESSAGES.dead(cn)=1;                %update message list
  recovered=1;
else
  agt.age=age+1;
end