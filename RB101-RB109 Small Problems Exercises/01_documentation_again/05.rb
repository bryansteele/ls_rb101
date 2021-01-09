a = %w(a b c d e)
# puts a.fetch(7)
# puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }



# https://docs.ruby-lang.org/en/3.0.0/Array.html#method-i-fetch



# 05.rb:2:in `fetch': index 7 outside of array bounds: -5...5 (IndexError)     --- if out of range

# beats me --- returns the element at offset index if in range else, returns default-value
# 49 --- returns element at offset index if in range else(and block is NOT called); else it calls block and returns its value.
        # 7 is being passed in to the block and assigned to the local variable index which is being multiplied by itself.