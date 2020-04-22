function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent
%population.b
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update

n=length(agent);    %current no. of agents
n_new=0;    %no. new agents
prev_n=n;   %remember current agent number at the start of this iteration

%execute existing agent update loop
for cn=1:n
	curr=agent{cn};
    if isa(curr,'healthy_human')|isa(curr,'infected_human')
        curr=migrate(curr,cn);                  %determine direction of movement
    end
    if isa(curr,'infected_human')
        [curr,recovered]=recover(curr,cn);
        if recovered==1
            new=[];
            [curr,new]=spawn(curr,cn);			%if recovered, "die" and create new healthy agent
            if ~isempty(new)					%if current agent has "died" during this iteration
                 n_new=n_new+1;                 %increase new agent number
                 agent{n+n_new}=new;			%add new to end of agent list
            end
        end
        agent{cn}=curr;    
    end
    if isa(curr,'healthy_human')   
        [curr,inf]=infected(curr,cn);               %check for infection
        if inf==1
            new=[];
            [curr,new]=spawn(curr,cn);			%if infected, "die" and create new infected agent
            if ~isempty(new)					%if current agent has "died" during this iteration
                 n_new=n_new+1;                 %increase new agent number
                 agent{n+n_new}=new;			%add new to end of agent list
            end
        end
        agent{cn}=curr;                          %up date cell array with modified agent data structure
    end
end

temp_n=n+n_new; %new agent number
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list

