# ruby_scrabble

Returns the longest Scrabble word that contains only the tile letters passed in.

Clone to local filesystem (MacOS or Linux) and run as follows:

`> ruby scrabble.rb <tile letters>`

Time complexity optimizations include:
* Pare the dictionary list down to words between 2 and 7 characters since Scrabble rules don't handle words outside of that range
* Test to see if the first character of a dictionary word exists within the tile letters submitted before iterating through and comparing the characters of both words

Further optimization could be achieved by using a trie structure and initially loading a serialized hash of anagrams to search against.
