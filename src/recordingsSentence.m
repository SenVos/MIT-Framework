function [recordings, fs, path_sentence] = recordingsSentence(sentence)
% function to look up all the recordings of a specific sentence
% Usage [recordings, fs, path_sentence] = recordingsSentence(sentence)

% Input Parameter:
%	  sentence:      string which contains the sentence to be searched for

% Output Parameter:
%	 recordings: 	 cell array with all the recordings where the phoneme
%                    is spoken.
%    fs:             cell array with the corresponding sampling frequency
%    path_word:      directory path to the corresponding wave file

%--------------------------------------------------------------------------

%Example:
% 
% [recordings, fs, path_sentence]=recordingsSentence('she had your dark suit in greasy wash water all year')
% 
% recordings = 
% 
%     [48743x1 double]
%     [54681x1 double]
%     [47104x1 double]
%     ...
% 
% 
% fs = 
% 
%     [16000]
%     [16000]
%     [16000]
%     ...
% 
% 
% path_sentence = 
% 
%     '../TIMIT MIT/dr1-mcpm0/sa1.wav'
%     '../TIMIT MIT/dr1-fvmh0/sa1.wav'
%     '../TIMIT MIT/dr2-marc0/sa1.wav'
%     ...

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 28-Apr-2015  Initials DB, SV
% Ver. 1.00 functional function 28-Apr-2015  Initials DB, SV
% Ver. 1.10 gives out fs and path 30-Apr-2015  Initials DB, SV

% to avoid mistakes
if ~ischar(sentence)
    help recordingsSentence.m
    return;
end

% open the list with all sentences
allsenlist = fileread('../TIMIT MIT/allsenlist.txt');

% find the starting indices of the sentences
indices = strfind(allsenlist, sentence);

% how many recordings will be found? allocate space
totalLength = length(indices);
recordings = cell(totalLength, 1);
fs = cell(totalLength, 1);
path_sentence = cell(totalLength, 1);

for ii = 1:totalLength
    % find exact path, which stands before the sentence:
    % when is the last line break?
    lineBreaks = regexp(allsenlist(1:end), '\n');    
    % when were the previous line breaks? (0 for none yet)
    previousLineBreaks = 0;
    previousLineBreaks = [previousLineBreaks lineBreaks(indices(ii) > lineBreaks)];
    
    % get the path for the wave file (indices(ii)-3 because of the tabbing
    % after the filepath)
    path_sentence{ii} =['../TIMIT MIT/' allsenlist(previousLineBreaks(end)+1 : indices(ii)-3) '.wav'];
    
    % open the recordings and save in output variable
    [recordings{ii}, fs{ii}] = audioread(path_sentence{ii});
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