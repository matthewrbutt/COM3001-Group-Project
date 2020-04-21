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
   
age=agt.age;                %get current agent age
pos=agt.pos;         %current position

% x=rand;
% 
% if x<0.16
%     asymp=1
% else
%     asymp=0
% end
%
% Add asymp as parameter below if using this

new=infected_human(0,pos,PARAM.F_SPD);   %new infected human agent
