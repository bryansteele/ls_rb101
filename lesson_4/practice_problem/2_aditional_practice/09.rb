words = "the flintstones rock"

def titleize(string)
  titleized_string = string.split(' ').map! { |word| word.capitalize }
  titleized_string.join(' ')
end

puts titleize(words)


# words.split.map { |word| word.capitalize }.join(' ')