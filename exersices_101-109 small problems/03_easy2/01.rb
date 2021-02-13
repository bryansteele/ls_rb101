def get_age(age, name = 'Teddy')
  "#{name} is #{age} years old!"
end

age = rand(20..200)
puts get_age(age)
puts get_age(age, 'Bill')