function [agt]=migrate(agt,cn)

%migration functions for class HEALTHY_HUMAN
%agt=healthy_human object
%cn - current agent number

%SUMMARY OF healthy human MIGRATE RULE
%Its new position will be randomly placed within this square
%It will move randomly (up to 8 attempts without leaving the model edge)

global ENV_DATA IT_STATS N_IT 
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%interpolated to each grid point
%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km

mig=0;                               %indicates whether healthy human has successfully migrated
pos=agt.pos;                         %extract current position 
cpos=round(pos);                     %round up position to nearest grid point   
spd=agt.speed;                       %healthy human migration speed in units per iteration
 
mig=0;                          %flag will be reset to one if healthy human migrates

if mig==0                                   %healthy human chooses a random direction to move in      
    cnt=1;
    dir=rand*2*pi;              
    while mig==0&cnt<=8                     
        npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
        npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
        if npos(1)<ENV_DATA.bm_size&npos(2)<ENV_DATA.bm_size&npos(1)>=1&npos(2)>=1   %check that healthy human has not left edge of model - correct if so.
           mig=1;
        end
        cnt=cnt+1;
        dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
    end
end

if mig==1
    agt.pos=npos;                                   %update agent memory
    IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;    %update model statistics
end