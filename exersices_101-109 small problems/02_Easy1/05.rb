=begin
P - 
GOAL: write a method that takes a string - reverses the order or the strings and returns a NEW string with the reversed order.

INPUT: string
OUTPUT: a different/a new string

Rules / Constraints/ Conditions -
- one argument, which is a string
- if string is empty, return an empty string
- reverse the order of the words
  -return a new string with those words in it

A -
1. Define a method with one parameter, that takes a string
2. create an empty array to store the words in reverse order.
2. Convert the string into substrings using the spaces as the delimiters
      and store the substrings in an array
3. remove the last string and add it to index 0 of a new array
4. remove the (next)last string from array and add it to the new array.
      keep doing this until the array is empty
5. convert the array of strings into one string and return this string.

=end

def reverse_sentence (string)
  reversed_string = []
  split_string_array = string.split(' ')

  loop do
    break if split_string_array.empty?
    reversed_string << split_string_array.pop
  end

  reversed_string.join(' ')
end

# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end







puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'