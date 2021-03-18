puts 'Please enter the first number:'
first_number = gets.to_i

puts 'Please enter the second number:'
second_number = gets.to_i

puts "#{first_number} + #{second_number} = #{first_number + second_number}" 
puts "#{first_number} - #{second_number} = #{first_number - second_number}" 
puts "#{first_number} * #{second_number} = #{first_number * second_number}" 

if second_number != 0
  puts "#{first_number} / #{second_number} = #{first_number / second_number}"
  puts "#{first_number} % #{second_number} = #{first_number % second_number}" 
else
  puts "You can't have a divisor of 0"
end

puts "#{first_number} ** #{second_number} = #{first_number**second_number}" 
