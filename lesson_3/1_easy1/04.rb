numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1)
p numbers

puts

numbers = [1, 2, 3, 4, 5]
p numbers.delete(1)
p numbers

=begin

- The first one deletes the element at the given index, which is `2` and returns it.
2
[1, 3, 4, 5]



- The second one deletes all instances of the given element, which is `1` and returns the given number.
1
[2, 3, 4, 5]

=end