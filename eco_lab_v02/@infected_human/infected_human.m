classdef infected_human           %declares infected human object
    properties         %define infected human properties (parameters) 
        age;
        pos;
        speed;
        asymp;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @infected_human folder. 
        function f=infected_human(varargin) %constructor method for infected human  - assigns values to infected human properties

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    f.age=[];			
                    f.pos=[];
                    f.speed=[];
                    f.asymp=[];
                case 1                         %input is already a infected human, so just return!
                    if (isa(varargin{1},'infected human'))		
                        f=varargin{1};
                    else
                        error('Input argument is not a infected human')
                    end
                case 4                          %create a new infected human (currently the only constructor method used)
                    f.age=varargin{1};               %age of infected human object in number of iterations
                    f.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                    f.speed=varargin{3};             %number of kilometres infected human can migrate in 1 day
                    f.asymp=varargin{4}; 
                otherwise
                    error('Invalid no. of input arguments for infected human')
            end
        end
    end
end