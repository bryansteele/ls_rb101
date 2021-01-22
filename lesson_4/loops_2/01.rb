count = 1

loop do
  puts 'is odd!' if count.odd?
  puts 'is even!' if count.even?
  count += 1
  break if count == 5
end

