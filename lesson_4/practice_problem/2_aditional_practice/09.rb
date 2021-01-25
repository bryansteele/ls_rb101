words = "the flintstones rock"

words = words.split.each do |word|
          word.capitalize!
        end

words = words.join(' ')

puts words


# words.split.map { |word| word.capitalize }.join(' ')