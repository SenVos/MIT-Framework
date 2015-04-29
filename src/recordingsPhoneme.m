function [recordings] = recordingsPhoneme(phoneme)
% function to look up all the recordings of a specific phonem
% Usage [recordings] = recordingsPhoneme(phoneme)
% Input Parameter:
%	 phoneme: 	string to contain the phonem to be searched for
% Output Parameter:
%	 recordings: 	 cell array with all the recordings (and their sample
% frequency) where the phonem is spoken. To play the recording back use:
%       soundsc(recordings{x,1}, recordings{x,2})
% where x corresponds to the recording to be played back.
%------------------------------------------------------------------------ 
% Example: [recordings] = recordingsPhoneme('sh')
%
% 
% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 29-Apr-2015  Initials DB, SV
% Ver. 1.00 functional function 29-Apr-2015  Initials DB, SV

%------------Your function implementation here--------------------------- 

% open the list with all words and their corresponding samples
allsenlist = fileread('../TIMIT MIT/allphonetime.txt');

% how many recordings will be found? allocate space
totalLength = length(strfind(allsenlist, phoneme));
recordings = cell(totalLength, 2);
    
% find the indices of the phonem
indices = strfind(allsenlist, phoneme);

% catch error when looking for 'd' ('d' is the first letter of the first
% path)
if indices(1) == 1
    indices(1) = [];
end

for ii = 1:length(indices)
    
    % only consider phonems, not parts of the path (e.g. 's' is part of
    % 'dr1-mcpm0/sa1')
    if ~isletter(allsenlist(indices(ii)-1)) && ~isletter(allsenlist(indices(ii)+length(phoneme)))
        
        % find exact path, which stands at the beginning of the line:
        % i.e. when are the line breaks?
        lineBreaks = regexp(allsenlist(1:end), '\n');
        % when was the previous line break? (0 for none yet)
        previousLineBreaks = 0;
        previousLineBreaks = [previousLineBreaks lineBreaks(indices(ii) > lineBreaks)];
        % when is the next line break?
        nextLineBreaks = lineBreaks(indices(ii) < lineBreaks); 

        % when does the path end?
        pathEnd = regexp(allsenlist(previousLineBreaks(end)+1 : indices(ii)), '\s');
        recordingsPath = allsenlist(previousLineBreaks(end)+1 : previousLineBreaks(end)+pathEnd(1)-1);

        % find the start and end sample for the phonem
        regionOfInterest = regexp( allsenlist(previousLineBreaks(end)+1:nextLineBreaks(1)), [phoneme '\s\d+\s\d+'], 'match' );
        sampleRange = regexp( regionOfInterest{1}, '\d+', 'match');
        sampleRange = str2double(sampleRange);
        % open the recordings in the specified range
        [recordings{ii,1}, recordings{ii,2}] = audioread(['../TIMIT MIT/' recordingsPath '.wav'], sampleRange);
    end
end

%delete empty cells (which where created during allocation but where not
%filled in due to being a wordpart)
recordings(cellfun('isempty',recordings)) = [];
recordings = [recordings(1:end/2)' recordings(end/2+1:end)'];

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