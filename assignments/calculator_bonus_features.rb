def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def retrieve_number1
  first_number = ""
  loop do
    prompt("What's the first number?")
    first_number = gets.chomp

    break if valid_number?(first_number)
    prompt("Hmm.... that doesn't look like a valid number")
  end
  first_number
end

def retrieve_number2
  second_number = ""
  loop do
    prompt("What's the second number?")
    second_number = gets.chomp

    break if valid_number?(second_number)
    prompt("Hmm.... that doesn't look like a valid number")
  end
  second_number
end


def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  else
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = nil
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")
######################################################################### Main Loop
# first_number = ""
# second_number = ""
loop do
  first_number = retrieve_number1
  second_number = retrieve_number2

  operator_prompt = <<-MSG
    What operation would you like me to perform?
      1) add
      2) subtract
      3) multply
      4) divide
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             first_number.to_i() + second_number.to_i()
           when '2'
             first_number.to_i() * second_number.to_i()
           else
             first_number.to_f() / second_number.to_f()
           end

  prompt("The answer is: #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Calculator --- GOODBYE!")
