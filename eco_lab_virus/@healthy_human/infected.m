function [agt,inf]=infected(agt,cn)

%infected function for class HEALTHY_HUMAN
%agt=healthy_human object
%cn - current agent number
%inf=1 if agent 'dies', =0 otherwise

global PARAM IT_STATS N_IT MESSAGES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%PARAM is data structure containing migration speed and spawning
%frequency parameters for both infected humans and healthy humans
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=healthy_human, 2-infected_human, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have
   %    despawned
   %    in the current iteration

age=agt.age;                %get current agent age
pos=agt.pos;                        %extract current position 
spd=agt.speed;                      %healthy human migration speed in units per iteration
inf=agt.inf;                        %is the agent infected?
immunity=agt.immunity;              %is the agent immune?

typ=MESSAGES.atype;                                         %extract types of all agents
fx=find(typ==2);                                            %indices of all infected humans
rpos=MESSAGES.pos(fx,:);                                     %extract positions of all infected humans
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all infected humans
[d,ind]=min(csep);                                            %d is distance to closest healthy human, ind is index of that infected human
nrst=fx(ind);                                                  %index of nearest infected human(s)

if inf==0 & immunity~=1         %if the healthy human is not infected and not immune
    if d<=spd&length(nrst)>0    %if there is at least one infected human within the search radius        
        if length(nrst)>1       %if more than one infected human located at same distance then randomly pick one
            s=round(rand*(length(nrst)-1))+1;
            nrst=nrst(s);
        end
        
        prob_inf=0.2/d;                            %probability that infected human will infect healthy human is a function of distance to the closest infected human
        
        if prob_inf>rand                          %if infection succeeds then 'kill' agent and respawn as infected
            IT_STATS.died_h(N_IT+1)=IT_STATS.died_h(N_IT+1)+1;                %update model statistics
            MESSAGES.dead(cn)=1;                %update message list
            inf=1;
        end
    end
end