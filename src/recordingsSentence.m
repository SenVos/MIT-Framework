function [recordings, fs] = recordingsSentence(sentence)
% function to look up all the recordings of a specific sentence
% Usage [recordings] = recordingsSentence(sentences)
% Input Parameter:
%	 sentences: 	string to contain the sentence to be searched for
% Output Parameter:
%	 recordings: 	 cell array with all the recordings (and their sample
% frequency) where the sentence is spoken. To play the recording back use:
%       soundsc(recordings{x,1}, recordings{x,2})
% where x corresponds to the recording to be played back.
%------------------------------------------------------------------------ 
% Example: [recordings] = recordingsSentence('don''t ask me to carry an oily rag like that')
%
% recordings = 
% 
%     [39732x1 double]    [16000]
%     [40141x1 double]    [16000]
%     [38196x1 double]    [16000]
%     [45260x1 double]    [16000]
%     [49562x1 double]    [16000]
%     [49868x1 double]    [16000]
%     [44749x1 double]    [16000]
%     [49050x1 double]    [16000]
%     [47514x1 double]    [16000]
%     [44647x1 double]    [16000]
%     [55296x1 double]    [16000]
%     [49357x1 double]    [16000]
%     [44135x1 double]    [16000]
%     [53248x1 double]    [16000]
%     [41575x1 double]    [16000]
%     [58470x1 double]    [16000]
% 
% 
% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 28-Apr-2015  Initials DB, SV
% Ver. 1.00 functional function 28-Apr-2015  Initials DB, SV
% Ver. 1.10

%------------Your function implementation here--------------------------- 

% open the list with all sentences
allsenlist = fileread('../TIMIT MIT/allsenlist.txt');

% how many recordings will be found? allocate space
totalLength = length(strfind(allsenlist, sentence));
recordings = cell(totalLength, 1);
fs = cell(totalLength, 1);
    
% find the indices of the sentences
indices = strfind(allsenlist, sentence);

for ii = 1:length(indices)
    % find exact path, which stands before the sentence:
    % when is the last line break?
    lineBreaks = regexp(allsenlist(1:end), '\n');    
    % when was the previous line break? (0 for none yet)
    previousLineBreaks = 0;
    previousLineBreaks = [previousLineBreaks lineBreaks(indices(ii) > lineBreaks)];
    % when is the next line break?
    nextLineBreaks = lineBreaks(indices(ii) < lineBreaks); 
    
    % get the path for the wave file
    recordingsPath = allsenlist(previousLineBreaks(end)+1 : indices(ii)-3);
    
    % open the recordings and save in output variable
    [recordings{ii}, fs{ii}] = audioread(['../TIMIT MIT/' recordingsPath '.wav']);
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