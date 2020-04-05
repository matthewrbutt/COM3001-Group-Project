classdef healthy_human   %declares healthy_human object
    properties    %define healthy_human properties (parameters) 
        age; 
        pos;
        speed;
        inf;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @healthy_human folder. 
        function r=healthy_human(varargin) %constructor method for healthy_human - assigns values to healthy_human properties
                %r=healthy human(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that healthy human has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13


                switch nargin           %Use switch statement with nargin,varargin contructs to overload constructor methods
                    case 0				%create default object
                       r.age=[];			
                       %r.food=[];
                       r.pos=[];
                       r.speed=[];
                       r.inf=[];
                       %r.last_spawn=[];
                    case 1              %input is already a healthy human, so just return!
                       if (isa(varargin{1},'healthy_human'))		
                            r=varargin{1};
                       else
                            error('Input argument is not a healthy human')
                            
                       end
                    case 4               %create a new healthy human (currently the only constructor method used)
                       r.age=varargin{1};               %age of healthy_human object in number of iterations
                       %r.food=varargin{2};              %current food content (arbitrary units)
                       r.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                       r.speed=varargin{3};             %number of kilometres healthy human can migrate in 1 day
                       r.inf=varargin{4};
                       %r.last_spawn=varargin{5};        %number of iterations since healthy human last reproduced.
                    otherwise
                       error('Invalid no. of input arguments')
                end
        end
    end
end
