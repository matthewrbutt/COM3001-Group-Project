function c=set(c,prop_name,val)

%standard function to allow insertion of memory parameters from healthy_human object

switch prop_name
   
%case 'food'
%   c.food=val;
case 'pos'
    c.pos=val; 
case 'age'
   c.age=val;
case 'speed'
   c.speed=val; 
%case 'last_spawn'
%   c.last_spawn=val; 
otherwise 
   error('invalid field name')
end
