require 'yaml'
MESSAGES = YAML.load_file('rps_msgs.yml')
WINNING_MATCH = 5
VALID_CHOICES = {
  'r': 'rock',
  'p': 'paper',
  's': 'scissors',
  'k': 'spock',
  'l': 'lizard'
}
WINNING_VARIATIONS = {
  'rock': ['scissors', 'lizard'],
  'paper': ['rock', 'spock'],
  'scissors': ['paper', 'lizard'],
  'spock': ['rock', 'scissors'],
  'lizard': ['paper', 'spock']
}

def clear_screen
  system('clear') || system('clr')
end

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  puts("=> #{message}")
end

def display_instructional_greeting
  prompt(messages('welcome'))
  prompt(messages('instructions'))
end

def valid_enter_key?(key)
  key == "\n"
end

def prompt_user_to_begin
  prompt(messages('enter_key'))

  loop do
    key = gets
    break if valid_enter_key?(key)
    prompt(messages('invalid_key'))
  end
end

def initialize_score
  { player: 0, computer: 0 }
end

def valid_choice?(choice_received)
  %w(r p s k l).include?(choice_received)
end

def retrieve_player_choice
  prompt(messages('player_choice'))
  choice = ''

  loop do
    choice = gets.chomp
    break if valid_choice?(choice)
    prompt(messages('invalid_choice'))
  end

  VALID_CHOICES.fetch(choice.downcase.to_sym)
end

def retrieve_computer_choice
  VALID_CHOICES.values.sample
end

def display_choices(players_choice, computers_choice)
  prompt("You Chose: #{players_choice.upcase}..." \
          "I Chose: #{computers_choice.upcase}.\n")
end
###########################################################################   START
clear_screen()
display_instructional_greeting()
prompt_user_to_begin()
clear_screen()
######################################################################      MAIN LOOP
loop do
  scoreboard = initialize_score()
  
  loop do
    player_choice = retrieve_player_choice()
    computer_choice = retrieve_computer_choice()
    clear_screen()
    display_choices(player_choice, computer_choice)

    results(player_choice, computer_choice)




    prompt("Do you want to play again?")
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

prompt('GODDBYE!')
