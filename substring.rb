# script to count words in a string which appear in a defined dictionary

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit""below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def count_words_in_dictionary(string, reference)
#remove all nonalphanumeric characters and split string into array.
string.downcase!
string.gsub! /[^\w\s]/, ''
p string
string_array = string.split " "
# create output hash and fill it with keys of word from teh string and values of counts of the string in the dictionary
output_hash = {}
string_array.map {|str| output_hash[str] = reference.count(str)}
p output_hash
end

count_words_in_dictionary("Howdy partner, sit down! How's it going?", dictionary)

def count_words_in_string(string, reference)
#clean up string and make array
string.downcase!
string.gsub! /[^\w\s]/, ''
p string
string_array = string.split " "
#create output hash and fill it with keys from string and values from count.
output_hash = {}
reference.map {|str| output_hash[str] = string_array.count(str)}
p output_hash
end

count_words_in_string("Howdy partner, sit down! How's it going?", dictionary)