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

recPerson = recordingsPerson(person);
recSentence = recordingsSentence(sentence);
recWord = recordingsWord(word);
recPhoneme = recordingsPhoneme(phoneme);

cd ..

recordings = recSentence;

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