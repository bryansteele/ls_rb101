CURRENT_YEAR = Time.now.year

puts "=> What is your age?"
age = gets.to_f

puts "=> At what age would you like to retire?"
retirement_age = gets.to_f

years_left = retirement_age - age
retirement_year = CURRENT_YEAR + years_left

puts "=> Today, it's #{CURRENT_YEAR}.\n
=> You will retire in #{retirement_year.round}.\n
=> You only have #{years_left.round} years of work to go!"