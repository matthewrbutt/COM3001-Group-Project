function [agt]=migrate(agt,cn)

%migration functions for class INFECTED_HUMAN
%agt=infected_human object
%cn - current agent number

%SUMMARY OF INFECTED HUMAN MIGRATE RULE
%It will pick a random migration direction to move in
%If it will leave the edge of the model, the direction is incremented by 45
%degrees at it will try again (up to 8 times)

global PARAM IT_STATS N_IT ENV_DATA

%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%ENV_DATA is a data structure containing information about the model
%environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
  
bm=ENV_DATA.bm_size;   
spd=agt.speed;   %migration speed in units per iteration
pos=agt.pos;     %extract current position
age=agt.age;    %current age
asymp=agt.asymp; %is the agent asymptomatic?

mig=0;
cnt=1;
dir=rand*2*pi;              %infected human chooses a random direction to move in

if asymp==1
    movement_period=PARAM.I_PERIOD+PARAM.S_DURATION;      %if the agent is asymptomatic, it can move during incubation period and symptom duration
else
    movement_period=PARAM.I_PERIOD;     %if the agent is not asymptomatic, it can only move during incubation period
end

while mig==0&cnt<=8&age<=movement_period     %infected human has up to 8 attempts to migrate (without leaving the edge of the model)
    npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
    npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
    if npos(1)<ENV_DATA.bm_size&npos(2)<ENV_DATA.bm_size&npos(1)>=1&npos(2)>=1   %check that infected human has not left edge of model - correct if so.
       mig=1;
    end
    cnt=cnt+1;
    dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
end

if mig==1
    agt.pos=npos;                    %update agent memory
    if spd > 0
        IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;    %update model statistics (if agent actually moves)
    end
end


    
   
