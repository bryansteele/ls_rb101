=begin
- INPUT: one string, containing 1 or more words
- OUTPUT: Returns the given string 'modified'

- if the given string has words with 5 or more charaters - REVERSE the word
- the given string will only have letters and spaces.
- spaces are only included when more than one word is in the string

---
- ('Professional')          # => lanoisseforP
  ('Walk around the block') # => Walk dnuora the kcolb
  ('Launch School')         # => hcnuaL loohcS

---
Algoritm
1. define method that takes 1 string
2. split the string and store in an array (spaces as the delimiter)
3. iterate over the array and reverse strings with 5 or more charachters
    return array of strings with the reversed words.
4. join the array of strings into 1 string again
=end

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.length >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS