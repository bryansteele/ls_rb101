puts ">> Please enter an integer greater than 0:"
int = gets.to_i

int_list = 1..int

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
compute_choice = gets

if compute_choice == 's'
  total = int_list.sum
  compute_choice = 'sum'
  return
elsif compute_choice == 'p'
  total = int_list.reduce(1) { |prod, n| prod *n }
  compute_choice = 'product'
else
  puts 'Invalid Entry!'
end

puts "The #{compute_choice} of the integers between 1 and #{int} is #{total}."