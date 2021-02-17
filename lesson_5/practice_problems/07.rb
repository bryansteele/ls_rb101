a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a     # => 2
p b     # => [3, 8]
p arr   # => [4, [3, 8]]

=begin
a is not modified at all. 2 is imuttable
b did change because it is an array and the element inside changed
arr[0] is changed to 4
arr[1][0] is changed to 3
=end