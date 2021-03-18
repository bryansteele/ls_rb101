puts "Please write a word or phrase:"
string_input = gets.chomp
puts

characters = []
string_input.chars.map do |char|
  characters << char if char != ' '
end

puts "There are #{characters.count} characters in '#{string_input}'."


# print 'Please write word or multiple words: '
# input = gets.chomp
# number_of_characters = input.delete(' ').size
# puts "There are #{number_of_characters} characters in \"#{input}\"."