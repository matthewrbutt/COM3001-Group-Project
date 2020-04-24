function [agent]=create_agents(nh,ni)

 %creates the objects representing each agent
 
%agent - cell array containing list of objects representing agents
%nh - number of healthy humans
%ni - number of infected humans

%global parameters
%ENV_DATA - data structure representing the environment (initialised in
%create_environment.m)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation
 
 global ENV_DATA MESSAGES PARAM 
  
bm_size=ENV_DATA.bm_size;
hloc=(bm_size-1)*rand(nh,2)+1;      %generate random initial positions for healthy humans
iloc=(bm_size-1)*rand(ni,2)+1;      %generate random initial positions for infected humans

MESSAGES.pos=[hloc;iloc];

%generate all healthy agents
for h=1:nh
    pos=hloc(h,:);
    %create healthy agents with age 0
    age=0;
    agent{h}=healthy_human(age,pos,PARAM.H_SPD,0,0);
end

%generate all infected agents
for i=nh+1:nh+ni
    pos=iloc(i-nh,:);
    %create infected agents with age 0
    age=0;
    x=rand;         %agent has a 16% chance of becoming an asymptomatic carrier
    if x<0.16
        asymp=1;
    else
        asymp=0;
    end
    agent{i}=infected_human(age,pos,PARAM.I_SPD,asymp);
end
