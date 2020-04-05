function [agt,klld]=die(agt,cn)

%death function for class HEALTHY_HUMAN
%agt=healthy_human object
%cn - current agent number
%klld=1 if agent dies, =0 otherwise

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
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration

klld=0;
%thold=PARAM.R_MINFOOD;      %threshold minimum food value for death to occur
%cfood=agt.food;             %get current agent food level
%age=agt.age;                %get current agent age
pos=agt.pos;                        %extract current position 
spd=agt.speed;                      %infected human migration speed in units per iteration
inf=agt.inf;

typ=MESSAGES.atype;                                         %extract types of all agents
fx=find(typ==2);                                            %indices of all healthy humans
rpos=MESSAGES.pos(fx,:);                                     %extract positions of all healthy humans
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all healthy humans
[d,ind]=min(csep);                                            %d is distance to closest healthy human, ind is index of that healthy human
nrst=fx(ind);                                                  %index of nearest healthy human(s)

if inf==0
    if d<=spd&length(nrst)>0    %if there is at least one healthy human within the search radius        
        if length(nrst)>1       %if more than one healthy human located at same distance then randomly pick one to head towards
            s=round(rand*(length(nrst)-1))+1;
            nrst=nrst(s);
        end
        pk=0.02/d                            %probability that infected human will infect healthy human is ratio of speed to distance
        if pk>rand
            IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
            MESSAGES.dead(cn)=1;                %update message list
            klld=1;
        end
    end
end


%if cfood<=thold|age>PARAM.R_MAXAGE      %if food level < threshold and age > max age then agent dies
    %IT_STATS.died_r(N_IT+1)=IT_STATS.died_r(N_IT+1)+1;  %update statistics
    %MESSAGES.dead(cn)=1;                %update message list
    %klld=1;
%end
