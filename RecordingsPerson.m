%function to search for all wav-files which belong to the commited name
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
recordings={}; number_of_files=size(recording_names); kk=1;
%takes sampled data and sample rate from every wav-file and put it into a
%cell-array
while kk~= number_of_files(2)
    %specific path of every wav-file
    path_wavfile=[direction_person recording_names{kk}];
    %find out sampled_data,sample_rate
    [sampled_data,sample_rate]=audioread(path_wavfile);
    %save sampled_data,sample_rate into recordings
    recordings=[recordings;{sampled_data,sample_rate}]
    kk=kk+1;
end

end

