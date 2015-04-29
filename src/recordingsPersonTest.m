% Script to test recordingsPerson.m

clear;
%-----------------------right entry---------------------------

%Name of the person
person_name='dr1-fvmh0';
%run recordingsPerson.m
[recordings] = recordingsPerson(person_name)

%----------------------wrong entry----------------------------

%Name of the person
person_name='Oliver Kahn';
%run recordingsPerson.m
[recordings] = recordingsPerson(person_name)
