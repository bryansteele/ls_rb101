munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

i = 0
names = munsters.keys
ages = []
gender = []

loop do 
  break if i >= munsters.size

  munsters.each_value do |hsh|
    ages << hsh['age'].to_s
  end

  munsters.each_value do |hsh|
    gender << hsh['gender']
  end

  puts "#{names[i]} is a #{ages[i]}-year-old #{gender[i]}."

  i += 1
end

# munsters.each_pair do |name, details|
# puts "#{name} is a #{details['age']} year old #{details['gender']}"
# end