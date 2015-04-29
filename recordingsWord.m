function [recordings] = recordingsWord(word)
% function to find the recording sections, which contain a specific word
% Usage [recordings] = recordingsWord(word)
% Input Parameter:
%	 word: 		 string to contain the word to be searched for
% Output Parameter:
%	 recordings: 	 cell array with all the recordings (and their sample
% frequency) where the word is spoken. To play the recording back use:
%       soundsc(recordings{x,1}, recordings{x,2})
% where x corresponds to the recording to be played back.
%------------------------------------------------------------------------ 
% Example: [recordings] = recordingsWord(word)


% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 29-Apr-2015  Initials DB and SV

%------------Your function implementation here--------------------------- 


% open the list with all words and their corresponding samples
allsenlist = fileread('TIMIT MIT\allsentime.txt');

% how many recordings will be found? allocate space
totalLength = length(strfind(allsenlist, word));
recordings = cell(totalLength, 2);
    
% find the indices of the sentences
indices = strfind(allsenlist, word);

for ii = 1:length(indices)
    
    % only consider full words, not wordparts (e.g. 'vanquished', when you
    % look for 'she')
    if ~isletter(allsenlist(indices(ii)-1)) && ~isletter(allsenlist(indices(ii)+length(word)))
        
        % find exact path, which stands at the beginning of the line:
        % i.e. when where the last line breaks?
        lineBreaks = regexp(allsenlist(1:indices(ii)), '\n');
        if isempty(lineBreaks)
        % if there was no line break yet    
            lineBreaks = 0;
        end
        % when does the path end?
        pathEnd = regexp(allsenlist(lineBreaks(end)+1 : indices(ii)), '\s');
        recordingsPath = allsenlist(lineBreaks(end)+1 : lineBreaks(end)+pathEnd(1)-1);

        % open the recordings and save in output variable
        [recordings{ii,1}, recordings{ii,2}] = audioread(['TIMIT MIT/' recordingsPath '.wav']);
        
    end
end

%delete empty cells (which where created during allocation but where not
%filled in due to being a wordpart)
recordings(cellfun(@isempty,recordings)) = [];


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