arr = ['10', '11', '9', '7', '8']

p arr.sort_by! { |str| str.to_i }.reverse

# p arr.sort { |a, b| a.to_i <=> b.to_i }