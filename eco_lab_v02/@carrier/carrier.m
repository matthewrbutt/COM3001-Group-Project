classdef carrier           %declares carrier object
    properties         %define fox properties (parameters) 
        age;
        pos;
        speed;
    end
    methods                         %note that this class definition mfile contains only the constructor method!
                                    %all additional member functions associated with this class are included as separate mfiles in the @fox folder. 
        function c=carrier(varargin) %constructor method for carrier  - assigns values to carrier properties

            switch nargin                     %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0                        %create default object
                    c.age=[];
                    c.pos=[];
                    c.speed=[];
                case 1                         %input is already a carrier, so just return!
                    if (isa(varargin{1},'carrier'))		
                        c=varargin{1};
                    else
                        error('Input argument is not a carrier')
                    end
                case 3                          %create a new carrier (currently the only constructor method used)
                    c.age=varargin{1};               %age of carrier object in number of iterations
                    c.pos=varargin{2};               %current position in Cartesian co-ords [x y]
                    c.speed=varargin{3};             %number of kilometres carrier can migrate in 1 day
                otherwise
                    error('Invalid no. of input arguments for carrier')
            end
        end
    end
end