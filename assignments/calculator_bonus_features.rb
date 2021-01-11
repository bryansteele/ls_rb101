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

# def valid_number?(num)
#   /\d/.match(num) && /^\d*\.?\d*$/.match(num)
# end

# def retrieve_number(number_requested)
#   loop do
#     prompt("What's the #{number_requested}?")
#     number_requested = gets.chomp
#     break if valid_number?(number_requested)
#     prompt("Hmm.... that doesn't look like a valid number")
#   end

#   number_requested
# end

# def operation_to_message(op)
#   case op
#   when '1'
#     'Adding'
#   when '2'
#     'Subtracting'
#   when '3'
#     'Multiplying'
#   else
#     'Dividing'
#   end
# end
###############################################################START OF PROGRAM
system('clear') || system('clr')
welcome
language = retrieve_language
system('clear') || system('clr')
name = retrieve_name(language)


# prompt("Hi #{name}!")





################################################################## Main Loop
# loop do
#   first_number = retrieve_number('first number')
#   second_number = retrieve_number('second number')



#   operator_prompt = <<-MSG
#     What operation would you like me to perform?
#       1) add
#       2) subtract
#       3) multply
#       4) divide
#   MSG

#   prompt(operator_prompt)

#   operator = nil
#   loop do
#     operator = Kernel.gets().chomp()

#     if %w(1 2 3 4).include?(operator)
#       break
#     else
#       prompt("Must choose 1, 2, 3 or 4")
#     end
#   end

#   prompt("#{operation_to_message(operator)} the two numbers...")

#   result = case operator
#            when '1'
#              first_number.to_i() + second_number.to_i()
#            when '2'
#              first_number.to_i() * second_number.to_i()
#            else
#              first_number.to_f() / second_number.to_f()
#            end

#   prompt("The answer is: #{result}")

#   prompt("Do you want to perform another calculation? (Y to calculate again)")
#   answer = gets().chomp()
#   break unless answer.downcase().start_with?('y')
# end

# prompt("Thank you for using Calculator --- GOODBYE!")
