def reverse_words(string)
  new_arry =[]

  string.split.each do |x|
    x.reverse! if x.length >= 5
    new_arry << x
  end

  new_arry.join(' ')
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
