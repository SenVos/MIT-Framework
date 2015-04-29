% Script to test RecordingsPerson.m

clear;
%-----------------------right enter---------------------------

%Name of the person
person_name='dr1-fvmh0';
%run RecordingsPerson.m
[recordings] = RecordingsPerson(person_name)

%----------------------wrong enter----------------------------

%Name of the person
person_name='Oliver Kahn';
%run RecordingsPerson.m
[recordings] = RecordingsPerson(person_name)
