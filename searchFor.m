function [recordings] = searchFor(person, sentence, word, phoneme)
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

cd src

[recs_person, fs_wavfile, path_wavfile] = recordingsPerson(person);
[recs_sentence, fs_sentence, path_sentence] = recordingsSentence(sentence);
[recs_word, fs_word, path_word, sampleRange_word] = recordingsWord(word);
[recs_phoneme, fs_phoneme, path_phoneme, sampleRange_phoneme] = recordingsPhoneme(phoneme);

sampleRange_phoneme{1:10}

% get the filepath where all criteria fit
path = intersect(intersect(intersect(path_wavfile, path_sentence), path_word), path_phoneme);

% find the recording in the path
index_word = find(strcmp(path_word, path))
index_phoneme = find(strcmp(path_phoneme, path))

% for all words and phonemes that are in the sentence and spoken by the
% person:
for kk=1:length(index_word)
    % set temporary variable for the sample range
    word = sampleRange_word{index_word(kk)}
    
    for ii=1:length(index_phoneme)
        % set temporary variable for the sample range
        pho = sampleRange_phoneme{index_phoneme(ii)}
        
        % compare the sampleRanges to see if the phoneme is part of the word
        if pho(1) >= word(1) && pho(2) <= word(2)
            recordings = recs_phoneme(index_phoneme);
        end
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