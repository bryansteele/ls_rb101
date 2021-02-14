array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

With the first `each` method, we are passing references of all the elements of array1 to array2. Although array1 and array2 are pointing to 2 different objects, the elements inside both are pointing to the same objects.

The second `each` method is upcasing the string if it meets the criteria of the `if` statement. Because array1 and array2's elements are pointing to the same objects, they will both be pointing to the modified strings from the upcase! method.

=end