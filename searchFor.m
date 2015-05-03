function [recordings, fs] = searchFor(person, sentence, word, phoneme)
% function to look for recordings of a person, sentence, word and phoneme
% in the MIT/TIMIT-database. The function combines all the search criteria.
% Usage [recordings] = searchFor(person, sentence, word, phoneme)
% 
% Input Parameter: (if there is no need for one or more criteria, set the
%                   parameter to 0)
%	 person: 		 
%	 sentence: 		 
%	 word:           
%	 phoneme: 		 
% Output Parameter:
%	 recordings: 	 Explain the parameter, default values, and units
%------------------------------------------------------------------------ 
% Example: [recordings] = searchFor(person, sentence, word, phoneme)

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 29-Apr-2015  Initials DB and SV

%------------Your function implementation here--------------------------- 

% error catching if all input variables were empty
if isempty(person) && isempty(sentence) && isempty(word) && isempty(phoneme)
   help searchFor;
   return;
end

% initialise empty directory path variables
path_person = []; path_sentence = []; path_word = []; path_phoneme = [];

cd src

%open the corresponding subfunctions and set filler to one of the paths
if ~isempty(person)
    [~, ~, path_person] = recordingsPerson(person);
    filler = path_person;
end
if ~isempty(sentence)
    [~, ~, path_sentence] = recordingsSentence(sentence);
    filler = path_sentence;
end
if ~isempty(word)
    [recs_word, fs_word, path_word, sampleRange_word] = recordingsWord(word);
    filler = path_word;
end
if ~isempty(phoneme)
    [recs_phoneme, fs_phoneme, path_phoneme, sampleRange_phoneme] = recordingsPhoneme(phoneme);
    filler = path_phoneme;
end

% use the function fillMeUp to fill the empty variables with variable filler
path_person = fillMeUp(path_person, filler);
path_sentence = fillMeUp(path_sentence, filler);
path_word = fillMeUp(path_word, filler);
path_phoneme = fillMeUp(path_phoneme, filler);

% get the filepath where all criteria fit
path = intersect(intersect(intersect(path_person, path_sentence), path_word), path_phoneme);



% allocate space for output variables
recordings = cell(length(path),1);
fs = cell(length(path),1);
sampleRange = cell(length(path),1);

% find the recording in the path
% TODO: Find correct indices of path_word, where it corresponds to path
% test it with this: [rec, fs] = searchFor([],sentence,word,phoneme)
index_word = find(ismember(path_word, path));
index_phoneme = find(ismember(path_phoneme, path));

% if both, word and phoneme, are needed
if ~isempty(word) && ~isempty(phoneme)
    
    % for all words and phonemes (that are in the sentence and spoken by
    % the person):
    for kk=1:length(index_word)
        % set temporary variable for the sample range
        word = sampleRange_word{index_word(kk)};

        for ii=1:length(index_phoneme)
            % set temporary variable for the sample range
            pho = sampleRange_phoneme{index_phoneme(ii)};

            % compare the sampleRanges to see if the phoneme is part of
            % the word
            if word(1) <= pho(1) && pho(2) <= word(2)
                sampleRange{ii} = pho;
            end
        end
    end
    % delete empty allocated cells
    sampleRange(cellfun('isempty',sampleRange)) = [];

% if only one, word or phoneme, is needed
else
    if exist('sampleRange_word')
        sampleRange = sampleRange_word(index_word);
    elseif exist('sampleRange_phoneme')
        sampleRange = sampleRange_phoneme(index_phoneme);
    else
        sampleRange = {[1,inf]};
    end
end

% read in wave files
for kk=1:length(path)
    for ii=1:length(sampleRange)
        [recordings{ii}, fs{ii}] = audioread(path{kk}, sampleRange{ii});
    end
end

cd ..


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