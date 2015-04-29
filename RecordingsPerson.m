%RECORDINGSPERSON(person_name) search for all wav-files in the corresponding
%   MIT/TIMIT-database which belong to the commited name the user puts in.
%   This function returns a cell-array.
%
%   Example for right use (dr1-fvmh0 belongs to the MIT/TIMIT-database)
%       recordings= RecordingsPerson(dr1-fvmh0)
%       recordings is a cell-array
%
%   Example for wrong use (Hans does not belong to the MIT/TIMIT-database)
%       recording s= RecordingsPerson(Hans)
%       ERROR

%   Copyright 2015 Sebastian Voges and Daniel Budelmann
%------------1-----------------
function [recordings] = RecordingsPerson(person_name)


%------------2-----------------
%create a string that contains the folder adress of the person the user
%chooses
main_folder_adress='TIMIT MIT/';
direction_person=[main_folder_adress person_name '/'];
%search folder of affected person for all files which ends with *.wav
folder_adress_person=dir([direction_person '*.wav']);


%------------3-------------------
%put all rocording names into a cell-array
recording_names={folder_adress_person.name};

%------------4 and 5-------------
%create all variables for the while-loop
number_of_files=length(recording_names);
recordings=cell(number_of_files,2);
%takes sampled data and sample rate from every wav-file and put it into a
%cell-array

for kk=1:number_of_files
    
    %specific path of every wav-file
    path_wavfile=[direction_person recording_names{kk}];
    %find out sampled_data,sample_rate
    [sampled_data,sample_rate]=audioread(path_wavfile);
    %save sampled_data,sample_rate into recordings
    recordings(kk,1)={sampled_data};
    recordings(kk,2)={sample_rate};
end

end

