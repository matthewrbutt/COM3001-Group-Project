% ** This function is not used **

function [agt,eaten]=eat(agt,cn)

%eating function for class infected human
%agt=infected human object
%cn - current agent number
%eaten = 1 if infected human successfully finds a healthy human, =0 otherwise

%SUMMARY OF infected human EAT RULE
%infected human calculates distance to all healthy humans
%infected human identifies nearest healthy humans(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of infected human killing healthy human =1 - distance of healthy human/speed of infected human
%If probability > rand, infected human moves to healthy human location and healthy human is
%killed
%If infected human does not kill healthy human, it's food is decremented by one unit

%GLOBAL VARIABLES
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=healthy human, 2-infected human, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
     
%Modified by D Walker 3/4/08

global  IT_STATS N_IT MESSAGES
   
pos=agt.pos;                        %extract current position 
cfood=agt.food;                     %get current agent food level
spd=agt.speed;                      %infected human migration speed in units per iteration - this is equal to the food search radius
hungry=1;
eaten=0;

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all healthy humans
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all healthy humans
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all healthy humans
[d,ind]=min(csep);                                            %d is distance to closest healthy human, ind is index of that healthy human
nrst=rb(ind);                                                %index of nearest healthy human(s)

if d<=spd&length(nrst)>0    %if there is at least one  healthy human within the search radius        
    if length(nrst)>1       %if more than one healthy human located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);                       %probability that infected human will kill healthy human is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this healthy human
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        agt.food=cfood+1;           %increase agent food by one unit
        agt.pos=npos;               %move agent to position of this healthy human
        IT_STATS.eaten(N_IT+1)=IT_STATS.eaten(N_IT+1)+1;                %update model statistics
        eaten=1;
        hungry=0;
        MESSAGES.dead(nrst)=1;       %send message to healthy human so it knows it's dead!
    end
end
if hungry==1
    agt.food=cfood-1;     %if no food, then reduce agent food by one unit
end


   
