function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent
%population.b
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update

%Created by Dawn Walker 3/4/08 

n=length(agent);    %current no. of agents
n_new=0;    %no. new agents
prev_n=n;   %remember current agent number at the start of this iteration

%execute existing agent update loop
for cn=1:n
	curr=agent{cn};
    if isa(curr,'rabbit')|isa(curr,'fox')
        curr=migrate(curr,cn);                  %determine direction of movement
        [curr,klld]=die(curr,cn);               %check for infection
        if klld==1
            new=[];
            [curr,new]=breed(curr,cn);			%if infected, "die" and create new infected agent
            if ~isempty(new)					%if current agent has "died" during this iteration
                 n_new=n_new+1;                 %increase new agent number
                 agent{n+n_new}=new;			%add new to end of agent list
             end
        end
       agent{cn}=curr;                          %up date cell array with modified agent data structure
    end
end

temp_n=n+n_new; %new agent number (before accounting for agent deaths)
[nagent,nn]=update_messages(agent,prev_n,temp_n);   %function which update message list and 'kills off' dead agents.

