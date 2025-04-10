// retrieve the input and store it in an array of "words"
var input = require('fs').readFileSync('/dev/stdin').toString();
var inputArray = input.split(" ");
 
var words = {};			// An object where the key is the word and the value is number of times it has appeared
var mostAppearedValue = 0;	// The number of times that the word that has appeared the most has appeared
var mostAppearedIndex = 0;	// The index in the inputArray where the word that appears the most first appeared
var longestValue = 0;		// The number of letters in the longest word
var longestIndex = 0;		// The index in the inputArray where the longest word first appeared
 
// go through every word
for (var i = 0; i < inputArray.length; i++) {
	// if the word is already registered in the word object
	if (words[inputArray[i]]) {
		// update the number of times this word has appeared
		words[inputArray[i]]++;
	}
	// if the word is not already registered in the word object
	else {
	// add the word to the words array and assign it an initial value of 1
	words[inputArray[i]] = 1;
 
		// check if this word is longer than the current longest word
		if (inputArray[i].length > longestValue) {
			longestValue = inputArray[i].length;
			longestIndex = i;
		}
	}
 
	// check if this word now appears more than the previous most common word
	if (words[inputArray[i]] > mostAppearedValue) {
		mostAppearedValue = words[inputArray[i]];
		mostAppearedIndex = i;
	}
}
 
// finally print out the word that appeared the most followed by the longest word
console.log(inputArray[mostAppearedIndex] + " " + inputArray[longestIndex]);