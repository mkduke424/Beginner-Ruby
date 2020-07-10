
require 'pry'

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substring (words, dictionary)       # input - create a method that takes a word and then an array of substrings (dicitonary)

  hash_counter = {}
  arr_words = words.split(" ")
  

  dictionary.each do |val|
    val = val.downcase
    arr_words.each do |word|
      word = word.downcase              # iterates through each word in the enetered sentence or string 
      if word.include?(val)             # checks if the word includes the word from the dictionary
        if hash_counter.has_key?(val)   # check if the hash key already exist 
          hash_counter[val] += 1        # add 1 to the value of the existing hash key
        else
          hash_counter[val] = 1         #if the hash doesn't exist create a new key and make its value zero
        end
      end
    end
  end
  puts hash_counter                     # output - a hash listing each substring that was found in the dictionary and how many times it was found
end

substring("Howdy partner, sit down! How's it going?",dictionary)


