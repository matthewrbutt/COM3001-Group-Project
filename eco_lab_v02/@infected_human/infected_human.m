classdef infected_human           %declares infected human object
    properties         %define infected human properties (parameters) 
        age;
        pos;
        speed;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @infected human folder. 
        function f=infected_human(varargin) %constructor method for infected human  - assigns values to infected human properties
                %f=infected human(age,food,pos....)
                %
                %age of agent (usually 0)
                %food - amount of food that healthy human has eaten
                %pos - vector containg x,y, co-ords 

                %Modified by Martin Bayley on 29/01/13

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];			
                    %f.food=[];
                    f.pos=[];
                    f.speed=[];
                    %f.last_spawn=[];
                case 1                         %input is already a infected human, so just return!
                    if (isa(varargin{1},'infected human'))		
                        f=varargin{1};
                    else
                        error('Input argument is not a infected human')
                    end
                case 3                          %create a new infected human (currently the only constructor method used)
                    f.age=varargin{1};               %age of infected human object in number of iterations
                    %f.food=varargin{2};              %current food content (arbitrary units)
                    f.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                    f.speed=varargin{3};             %number of kilometres infected human can migrate in 1 day
                    %f.last_spawn=varargin{5};        %number of iterations since infected human last reproduced.
                otherwise
                    error('Invalid no. of input arguments for infected human')
            end
        end
    end
end