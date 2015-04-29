
%------------1-------------
function [ recordings ] = RecordingsPerson(person_name)


%------------2-------------
%create a string that contains the folder adress of the person the user
%chooses
main_folder_adress='TIMIT MIT/';
direction_person=[main_folder_adress person_name '/'];
%search folder of affected person for all data which ends with *.wav
folder_adress_person=dir([direction_person '*.wav']);


%------------3-------------
%put all rocording names into a cell-array
recording_names={folder_adress_person.name};

%------------4-------------
yeah={}; juhu=size(recording_names); kk=1;

while kk~= juhu(2)
hallo=[direction_person recording_names{kk}];
[sampled_data,sample_rate]=audioread(hallo);
yeah=[yeah;{sampled_data,sample_rate}];
kk=kk+1;
end
%------------5-------------


recordings=yeah;
end

