def reverse_sentence (string)
  reversed_string = []
  split_string_array = string.split(' ')

  loop do
    break if split_string_array.empty?
    reversed_string << split_string_array.pop
  end

  reversed_string.join(' ')
end

# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end







puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'