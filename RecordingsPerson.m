
%------------1-------------
function [ recordings ] = RecordingsPerson(person_name)


%------------2-------------
%create a string that contains the folder adress of the person the user
%chooses
main_folder_adress='TIMIT MIT/'
direction_person=[main_folder_adress person_name '/']
%search folder of affected person for all data which ends with *.wav
folder_adress_person=dir([direction_person '*.wav'])


%------------3-------------
%put all rocording names into a cell-array
recording_names={folder_adress_person.name}

%------------4-------------

hallo=[direction_person recording_names{1}]
[sampled_data,sample_rate]=audioread(hallo)


%------------5-------------


recordings=hallo
end

