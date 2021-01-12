require 'yaml'
MESSAGES = YAML.load_file('mortgage_msgs.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts "=> #{message}"
end

def valid_name?(received_name)
  received_name =~ /^[a-zA-Z'-éëèñüúâîôïçø]+(?:\s[a-zA-Z'-éëèñüúâîôïçø]+)*$/
end

def retrieve_name
  system('clear') || system('clr')
  prompt(messages('welcome'))
  loop do
    name = gets.chomp
    return name if valid_name?(name)
    prompt(messages('invalid_name'))
  end
end

def greeting(name_str)
  system('clear') || system('clr')
  prompt(messages('hi') + name_str + '!')
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def valid_amount?(num)
  valid_number?(num) && num.to_f > 0
end

def retrieve_loan_amount
  prompt(messages('loan_amount'))
  loop do
    loan_amount = gets.chomp
    return loan_amount.to_f if valid_amount?(loan_amount)
    prompt(messages('invalid_amount'))
  end
end

def valid_num?(num)
  num =~ /^[+-]?([0-9]*[.])?[0-9]+$/
end

def retrieve_apr
  prompt(messages('apr'))
  loop do
    loan_apr = gets.chomp
    return loan_apr.to_f if valid_num?(loan_apr)
    prompt(messages('invalid_apr'))
  end
end

def retrieve_loan_duration_months
  prompt(messages('months'))
  loop do
    loan_duration_months = gets.chomp
    return loan_duration_months.to_f if valid_num?(loan_duration_months)
    prompt(messages('invalid_months'))
  end
end

def calculate_payment (amount, interest_rate, months)
  amount * (interest_rate / (1 - (1 + interest_rate) ** -months))
end

def result_prompt(payment)
  system('clear') || system('clr')
  prompt(messages('results') + payment.round(2).to_s)
end

def another_calculation
  prompt(messages('another_calc'))
  gets.chomp
end

def display_goodbye(name)
  system('clear') || system('clr')
  prompt(messages('goodbye1 ') + name)
  prompt(messages('goodbye2'))
end

# START OF PROGRAM
name = retrieve_name
greeting(name)

# MAIN LOOP
loop do
  loan_amount = retrieve_loan_amount
  monthly_interest_rate = retrieve_apr / 100 / 12
  loan_duration_months = retrieve_loan_duration_months

  monthly_payment = calculate_payment(loan_amount, monthly_interest_rate, loan_duration_months)

  result_prompt(monthly_payment)

  break unless another_calculation.downcase == 'y'
  system('clear') || system('clr')
end
display_goodbye(name)