function [recordings, fs, path_phoneme, sampleRange] = recordingsPhoneme(phoneme)
% function to look up all the recordings for a specific phoneme
% Usage [recordings, fs, path_phoneme, sampleRange] = recordingsPhoneme(phoneme)
% Input Parameter:
%	 phoneme: 	string which contains the phoneme to be searched for
% Output Parameter:
%	 recordings: 	 cell array with all the recordings where the phoneme
%                    is spoken.
%    fs:             cell array with the corresponding sampling frequency
%    path_word:      directory path to the corresponding wave file
%    sampleRange:    start and end sample, between which the phoneme is 
%                    spoken
% 
%------------------------------------------------------------------------ 
% Example: [recordings, fs, path_phoneme, sampleRange] = recordingsPhoneme('sh')
% 
% recordings = 
% 
%     [1891x1 double]
%     [2048x1 double]
%     [2241x1 double]
%     ...
%  
% fs = 
% 
%     [16000]
%     [16000]
%     [16000]
%     ...
%          
% path_word = 
% 
%     '../TIMIT MIT/dr1-mcpm0/sa1.wav'
%     '../TIMIT MIT/dr1-mcpm0/sa1.wav'
%     '../TIMIT MIT/dr1-mcpm0/sx294.wav'
%     ...
%          
% sampleRange = 
% 
%     [1x2 double]
%     [1x2 double]
%     [1x2 double]
%     ...
%
% To play the recording back use:
% soundsc(recordings{x}, fs{x})
% where x corresponds to the recording to be played back
% 
% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 29-Apr-2015  Initials DB, SV
% Ver. 1.00 functional function 29-Apr-2015  Initials DB, SV
% Ver. 1.10 added output of fs, path and range 30-Apr-2015  Initials DB, SV
% Ver. 1.20 optimized code 1-May-2015  Initials DB, SV

%------------Your function implementation here--------------------------- 

% to avoid mistakes
if ~ischar(phoneme)
   help recordingsPhoneme;
   return;
end


% open the list with all words and their corresponding samples
allphonetime = fileread('../TIMIT MIT/allphonetime.txt');

% find the indices of the phonem
indices = strfind(allphonetime, phoneme);

% catch error when looking for 'd' ('d' is the first char in allphonetime)
if indices(1) == 1
    indices(1) = [];
end

% how many recordings will be found? allocate space
totalLength = length(indices);
recordings = cell(totalLength, 1);
fs = cell(totalLength, 1);
path_phoneme = cell(totalLength, 1);
sampleRange = cell(totalLength, 1);

    
for ii = 1:totalLength
        
    % to find the exact directory, which stands at the beginning of the 
    % line, one has to find the line breaks
    lineBreaks = regexp(allphonetime(1:end), '\n');
    % when was the previous line break? (0 for none yet)
    prevLineBreaks = [0, lineBreaks(indices(ii)>lineBreaks)];
    
    %shorten allphonetime to start with directory of phoneme
    allphonetime = allphonetime(prevLineBreaks(end)+1:end);
    indices = indices - prevLineBreaks(end);
        
    % only consider phonemes, not parts of the directory (e.g. 's' is part     
    % of 'dr1-mcpm0/sa1'). In other words, only consider something followed
    % by a space
    if isspace(allphonetime(indices(ii)+length(phoneme)))

        % look for the directory(from linebreak to whitespace) and save it
        pathEnd = regexp(allphonetime(1 : indices(ii)), '\s', 'once');
        path_phoneme{ii} = ['../TIMIT MIT/' allphonetime(1:pathEnd-1) '.wav'];
        
        % find the start and end sample for the phoneme
        % first cut the string to just the phoneme and the sample range
        regionOfInterest = regexp( allphonetime(indices(ii):end), [phoneme '\s\d+\s\d+'], 'match', 'once' );
        % then extract only the range
        range = regexp( regionOfInterest, '\d+', 'match');
        sampleRange{ii} = str2double(range);
        % open the recordings in the specified range
        [recordings{ii}, fs{ii}] = audioread(path_phoneme{ii}, sampleRange{ii});
    end
end

%delete empty cells (which where created during allocation but where not
%filled in due to being a part of the directory)
recordings(cellfun('isempty',recordings)) = [];
fs(cellfun('isempty',fs)) = [];
path_phoneme(cellfun('isempty',path_phoneme)) = [];
sampleRange(cellfun('isempty',sampleRange)) = [];

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