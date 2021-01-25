[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block's return value here is the boolean true --- The return value of the block is determined by the return value of the last expression within the block. 

# Array#any? retruns true if the block EVER returns a value other than false or nil. Since the block returned true on the first iteration, the #any? method STOPS iterating and returns true.

# puts num is only invoked one time inside the block for the first element of the array.