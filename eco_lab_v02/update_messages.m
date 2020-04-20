function [nagent,nn]=update_messages(agent,prev_n,temp_n)

%agent - list of existing agents
%prev_n - previous number of agents at the start of this iteration
%temp_n - number of existing agents
%nagent - list of agents and empty structures
%nn - number of surviving agents

%global variables
%N_IT current iteration no
%IT_STATS data structure for saving model statistics
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=healthy human, 2-infected human, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGES.dead - n x1 array containing ones for agents that have
   %    despawned
   %    in the current iteration

%ENV_DATA - is a data structure containing information about the model
   %environment

global MESSAGES IT_STATS N_IT ENV_DATA

nagent=cell(1,temp_n);                  %initialise list for surviving agents
nn=0;                                   %tracks number of surviving agents
for cn=1:temp_n
    if isempty(agent{cn})               %agent despawned in a previous iteration (not the current one)
        dead=1;
    elseif cn<=prev_n                   %agent is not new, therefore it might have despawned
        dead=MESSAGES.dead(cn);         %will be one for agents that have despawned, zero otherwise
    else 
        dead=0;
    end
    if dead==0                          %if agent has not despawned
        nagent{cn}=agent{cn};           %copy object into the new list
        pos=get(agent{cn},'pos');
        MESSAGES.pos(cn,:)=pos;                    
         if isa(agent{cn},'healthy_human')
             MESSAGES.atype(cn)=1;
             IT_STATS.tot_r(N_IT+1)=IT_STATS.tot_r(N_IT+1)+1;
         elseif isa(agent{cn},'infected_human')
             MESSAGES.atype(cn)=2;
             IT_STATS.tot_f(N_IT+1)=IT_STATS.tot_f(N_IT+1)+1;
         end
         MESSAGES.dead(cn)=0;           %clear despawned message
         nn=nn+1;
    else                                %agent has despawned
        MESSAGES.pos(cn,:)=[-1 -1];     %enter dummy position in list
        MESSAGES.atype(cn)=0;           %set type to despawned
        MESSAGES.dead(cn)=0;            %clear despawned message
    end
end
IT_STATS.tot(N_IT+1)=nn;                %update total agent number