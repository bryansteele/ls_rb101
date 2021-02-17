NUMBER_OF_TIMES = {
  '1': '1st',
  '2': '2nd',
  '3': '3rd',
  '4': '4th',
  '5': '5th',
  '6': 'last'
}

def retrieve_numbers()
  num_list = []
  counter = 1
  
  loop do
    puts "==> Enter the #{NUMBER_OF_TIMES[counter.to_s.to_sym]} number:"
    num_list << gets.chomp
    counter += 1
    break if counter > 6
  end

  output_result(num_list.pop, num_list)
end

def verify_last_number(num, arr)
  arr.include?(num)
end

def output_result(num, arr)
  if verify_last_number(num, arr)
    puts "The number #{num} appears in #{arr}."
  else
    puts "The number #{num} does not appear in #{arr}."
  end
end

retrieve_numbers()