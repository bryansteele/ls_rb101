require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts("=> #{message}")
end

def welcome
  prompt(messages('welcome1'))
  prompt(messages('welcome1', 'ru'))
end

def valid_language?(num_str)
  %w(1 2).include?(num_str)
end

def change_language(num_str)
  return 'en' if num_str == '1'
  return 'ru' if num_str == '2'
end

def retrieve_language
  language_choice = ''
  loop do
    language_choice = gets.chomp
    break if valid_language?(language_choice)
    prompt(messages('valid_language'))
    prompt(messages('valid_language', 'ru'))
  end

  change_language(language_choice)
end

def valid_name?(name_str)
  !name_str.empty?
end

def retrieve_name(language)
  name = ''
  loop do
    prompt(messages('request_name', language))
    name = gets.chomp
    break if valid_name?(name)
    prompt(messages('valid_name', language))
  end

  name
end

def valid_number?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def retrieve_number(str_number, language)
  number_requested =''
  loop do
    prompt(messages(str_number, language))
    number_requested = gets.chomp
    break if valid_number?(number_requested)
    prompt(messages('invalid_number', language))
  end

  number_requested
end

def valid_operator?(num)
  %w(1 2 3 4).include?(num)
end

def retrieve_operator(language)
operator = ''
  loop do
    prompt(messages('operator_prompt', language))
    operator = gets.chomp
    break if valid_operator?(operator)
    system('clear') || system('clr')
    prompt(messages('invalid_operator', language))
  end
  operator
end

def zero_divisor_warning
  system('clear') || system('clr')
  prompt(messages('invalid_division', language))
end

result = nil
def perform_calculation(num1, num2, op)
  result = case op
           when '1' then num1.to_i + num2.to_i
           when '2' then num1.to_i - num2.to_i
           when '3' then num1.to_i * num2.to_i
           when '4'
             if !(num2 == 0 && op == '4')
                zero_divisor_warning 
             else
                num1.to_f / num2.to_f
             end
           end
  result         
end

def display_results(calculated_results, language)
  prompt(messages('results', language) + calculated_results.to_f.to_s)
end

def retrieve_calc_again_answer(language)
  prompt(messages('another_calculation', language))
  calc_again_answer = gets.chomp
end



#START of PROGRAM
system('clear') || system('clr')
welcome
language = retrieve_language
system('clear') || system('clr')
name = retrieve_name(language)
system('clear') || system('clr')
prompt(messages('hi', language) + " #{name}!") 

#Main Loop
loop do
  first_number = retrieve_number('first_number', language)
  second_number = retrieve_number('second_number', language)

  operation = retrieve_operator(language)

  results = perform_calculation(first_number, second_number, operation)
  
  display_results(results, language)

  calc_again_answer = retrieve_calc_again_answer(language)
  break unless calc_again_answer.downcase == 'y'
end

system('clear') || system('clr')
prompt(messages('goodbye', language))
