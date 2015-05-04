 MIT/TIMIT-Framework 
====================

This framework can be used to extract recordings from the MIT/TIMIT-database.

You can search for the following criteria:

	1. Person
	2. Sentence
	3. Word
	4. Phoneme

It is also possible to combine one or more criteria for a specific quest.

# Installation instruction

For the use of this project [MATLAB](http://de.mathworks.com/) and all files in our repository 'MIT-Framework' are needed.
Except MATLAB you can download all data from the same repository in which this README is located.
After downloading all necessary components, add the path where you saved the files to the MATLAB path or choose this path as your current folder in MATLAB.
Without this MATLAB can not find the necessary functions.

# Structure of this project

This project contains five subsections:

	1. TIMIT MIT (folder)
	2. src (folder)
	3. README.md
	4. searchFor.m
	5. searchForTest.m

The TIMIT MIT-folder contains the MIT/TIMIT-database.<br />
Src means Source-Code. This folder consists of all necessary functions which are needed for searchFor.m. If you want to test a function out of this folder use the respective tester. You identify all testers because of their suffix 'Test'. <br />
README.md contains this text.<br />
SearchFor is the function you can use to rummage the MIT/TIMIT-database. How to use this function will be explained in the next chapter 'Usage'.<br />
With searchForTest.m the main function searchFor.m can be tested.

# Usage

This chapter is seperated in two paragraphs: searching for one criterion and searching for more criteria.

## Searching for one criterion

If you want to search for one criterion (either person, sentence, word or phoneme) use the function searchFor.m.

```[recordings,fs] = searchFor(person, sentence, word, phoneme)```

For other criteria which are not required put an empty variable ([ ]) instead.<br />
SearchFor.m returns two variables:<br />

	1. recordings = includes all sampled data (cell-array) which belong to your criterion
	2. fs         = includes all sample frequencies (cell-array) which belong to your criterion



__For Example:__

```[recordings,fs] = searchFor('dr2-marc0',[ ],[ ],[ ])```

returns all recordings with the fitting sample frequencies which belong to 'dr2-marc0'.


## Searching for more criteria

If you want to search for more criteria you can also use the function searchFor.m.

```[recordings,fs] = searchFor(person, sentence, word, phoneme)```

Put in all criteria you want to search for.
For other criteria which are not required put an empty variable ([ ]) instead.<br />

__For Example:__

```[recordings,fs] = searchFor('dr2-marc0',[ ],'wash',[ ])```

returns all recordings from user 'dr2-marc0' in which the word 'wash' appears.



# Authors

This framework was developed by Daniel Budelmann and Sebastian Voges as part of a course project in 'data and algorithm'.




# License

This project is licensed under the GNU General Public License.
See [this website](http://www.gnu.org/licenses/gpl.html)  for details.