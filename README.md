 MIT/TIMIT-Framework 
====================
This framework can be used to extract recordings from the MIT/TIMIT-database.

You can search for the following criteria:

	1. Person
	2. Sentence
	3. Word
	4. Phoneme

# Searching for one criterion

If you want to search for one criterion (either person, sentence, word or phoneme) use the function searchFor.m.

```[recordings,fs] = searchFor(person, sentence, word, phoneme)```

For the other criteria which are not required put an empty variable ([ ]) instead.<br />
SearchFor.m returns two variables:<br />

	1. recordings = includes all sampled data (cell-array) which belong to your criterion
	2. fs         = includes all sample frequencies (cell-array) which belong to your criterion



__For Example:__

<kbd>[recordings,fs] = searchFor('dr1-fvmh0',[ ],[ ],[ ])</kbd>

Returns all recordings with the fitting samlpe frequencies which belong to 'dr1-fvmh0'.

# Searching for more criteria


# License
This project contains the GNU General Public License.
See [this website](http://www.gnu.org/licenses/gpl.html)  for details.