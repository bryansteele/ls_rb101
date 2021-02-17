hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |arr|
  arr.flatten.each_with_index do |letter, word|
    p word
    p letter
  end
end
