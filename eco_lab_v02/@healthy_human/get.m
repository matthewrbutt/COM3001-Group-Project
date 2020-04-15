function val=get(c,prop_name)

%standard function to allow extraction of memory parameters from healthy_human object

switch prop_name
   
case 'age'
    val=c.age;
% case 'food'
%    val=c.food;
case 'pos'
    val=c.pos;
case 'speed'
    val=c.speed;
case 'immunity'
    val=c.immunity;
% case 'last_spawn'
%      val=c.last_spawn; 
otherwise 
   error('invalid field name')
end

