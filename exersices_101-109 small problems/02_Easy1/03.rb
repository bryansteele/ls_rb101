# input: one +integer
# output: array of all digits in the given number
#        Ex. 356 => [3, 5, 6]
#        Ex.   7 => [7]

# Take given number and convert to a list of all separate digits

#  convert to string
#  convert to an array of strings
#  iterate array and convert each string to integer


def digit_list(num)
  num.to_s.chars.map { |char| char.to_i }
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true