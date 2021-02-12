[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin

The block's return value is a boolean at the end of each iteration, because that's what the method odd? returns. If it's an odd integer, then it returns true, of false if it's no odd.

The any? method outputs & returns:

1
=> true

any? returns true if any element of self meets a given criterion. Since the first iteration met the criterion, it returned true and stops the iterations as it doesn't need to go any further.

=end