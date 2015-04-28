function [recordings] = recordingsSentence(sentences)
% function to look up all the recordings of a specific sentence
% Usage [recordings] = recordingsSentence(sentences)
% Input Parameter:
%	 in_param: 		 Explain the parameter, default values, and units
% Output Parameter:
%	 out_param: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 28-Apr-2015  Initials DB, SV

%------------Your function implementation here--------------------------- 

% open the list with all sentences
allsenlist = fileread('TIMIT MIT\allsenlist.txt');

% how many recordings will be found? allocate space
totalLength = length(strfind(allsenlist, sentences));
recordings = cell(totalLength, 2);
    
% find the indices of the sentences
indices = strfind(allsenlist, sentences);

for ii = 1:length(indices)
    % open the recordings and save in output variable
    recordingsPath = allsenlist(indices(ii)-15 : indices(ii)-3)
    [recordings{ii,1}, recordings{ii,2}] = audioread(['TIMIT MIT/' recordingsPath '.wav']);
end

%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> Daniel Budelmann and Sebastian Voges
% Jade University of Applied Sciences 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.