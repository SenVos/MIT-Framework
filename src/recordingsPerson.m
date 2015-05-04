function [recordings, fs, path_wavfile] = recordingsPerson(person_name)
% Function to search for all wav-files in the corresponding
% MIT/TIMIT-database which belong to the commited name the user puts in.
% Usage [recordings, fs, path_wavfile] = recordingsPerson(person_name)
%
% Input Parameter:
%	 person_name: 	 string which contains the persons name to be searched for
%
% Output Parameter:
%	 recordings: 	 cell array with all the recordings where the phoneme
%                    is spoken.
%    fs:             cell array with the corresponding sampling frequency
%    path_word:      directory path to the corresponding wave file
%
%--------------------------------------------------------------------------
% 
% Example:
% 
% [recordings,fs, path_file]=recordingsPerson('dr1-fvmh0')
% 
% recordings = 
% 
%     [54681x1 double]
%     [40141x1 double]
%     [67379x1 double]
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
% path_file = 
% 
%     '../TIMIT MIT/dr1-fvmh0/sa1.wav'
%     '../TIMIT MIT/dr1-fvmh0/sa2.wav'
%     '../TIMIT MIT/dr1-fvmh0/si1466.wav'
%     ...
    
% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF

% to avoid mistakes
if ~ischar(person_name)
    help recordingsPerson.m
    return;
end

%create a string that contains the folder adress of the person the user
%chooses
direction_person=['../TIMIT MIT/' person_name '/'];
%search folder of affected person for all files which ends with *.wav
folder_adress_person=dir([direction_person '*.wav']);

%put all recording names into a cell-array
recording_names={folder_adress_person.name};

%create all variables for the while-loop
number_of_files=length(recording_names);
recordings=cell(number_of_files,1);
fs=cell(number_of_files,1);
path_wavfile=cell(number_of_files,1);

%take sampled data, sample frequency and the corresponding path from every
%wav-file and put it into a cell-array
for kk=1:number_of_files
    
    %specific path of every wav-file
    path_wavfile{kk}=[direction_person recording_names{kk}];
    %find out sampled_data,sample_rate
    [sampled_data,sample_rate]=audioread(path_wavfile{kk});
    %save sampled_data,sample_rate into recordings
    recordings(kk)={sampled_data};
    fs(kk)={sample_rate};
end

end
