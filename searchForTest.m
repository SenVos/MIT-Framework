% Script to test the function searchFor.m 
% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 29-Apr-2015          Initials DB and SV
% Ver. 1.00 Tester implemented 4-May-2015       Initials DB and SV

clear;
close all;
clc;


%Define your parameters and adjust your function call
person = 'dr1-mcpm0';
sentence = 'she had your dark suit in greasy wash water all year';
word = 'greasy';
phoneme = 's';

% Test for 4 criteria
[rec, fs] = searchFor(person, sentence, word, phoneme);
assert(length(rec{1}) == 1438, 'Wrong number of samples extracted');

% Test for 3 criteria
[rec, fs] = searchFor(person, sentence, word, []);
assert(length(rec{1}) == 5599, 'Wrong number of samples extracted');

% Test for 2 criteria
[rec, fs] = searchFor(person, sentence, [], []);
assert(length(rec{1}) == 48743, 'Wrong number of samples extracted');

% Test for 1 criteria
[rec, fs] = searchFor(person, [], [], []);
assert(length(rec) == 10, 'Wrong number of findings');


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