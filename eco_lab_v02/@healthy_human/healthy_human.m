classdef healthy_human   %declares healthy_human object
    properties    %define healthy_human properties (parameters) 
        age; 
        pos;
        speed;
        inf;
        immunity;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @healthy_human folder. 
        function r=healthy_human(varargin) %constructor method for healthy_human - assigns values to healthy_human properties
                %r=healthy human(age,food,pos....)
                %
                %age of agent (usually 0)
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13


                switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                    case 0				%create default object
                       r.age=[];
                       r.pos=[];
                       r.speed=[];
                       r.inf=[];
                       r.immunity=[];
                    case 1              %input is already a healthy human, so just return!
                       if (isa(varargin{1},'healthy_human'))		
                            r=varargin{1};
                       else
                            error('Input argument is not a healthy human')
                            
                       end
                    case 5               %create a new healthy human (currently the only constructor method used)
                       r.age=varargin{1};               %age of healthy_human object in number of iterations
                       r.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                       r.speed=varargin{3};             %number of kilometres healthy human can migrate in 1 day
                       r.inf=varargin{4};               %a boolean which stores if the agent is currently infected (but displaying no symptoms)
                       r.immunity=varargin{5};          %a boolean which stores if the agent has developed immunity
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
