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

def validate_winner_of_round(player, computer)
  if WINNING_VARIATIONS[player.to_sym].include?(computer)
    winner_of_round = 'player'
  elsif WINNING_VARIATIONS[computer.to_sym].include?(player)
    winner_of_round = 'computer'
  else
    winner_of_round = 'tie'
  end

  winner_of_round
end

def display_winner_of_round(player, computer, round_winner)
  if round_winner == 'player'
    prompt(messages(player + computer))
    prompt(messages('winner'))
  elsif round_winner == 'computer'
    prompt(messages(computer + player))
    prompt(messages('loser'))
  else
    prompt(messages('tie'))
  end
end

def increment_score(round_winner, scores)
  if round_winner == 'player'
    scores[:player] += 1
  elsif round_winner == 'computer'
    scores[:computer] += 1
  end
end

def display_incrementing_score(scores)
  prompt("Your Score: #{scores[:player]} My Score: #{scores[:computer]}\n \n ")
end

def game_over?(scores)
  scores[:player] == WINNING_MATCH || scores[:computer] == WINNING_MATCH
end

def establish_grand_winner(scores)
  if scores[:player] == WINNING_MATCH && scores[:computer] != WINNING_MATCH
    grand_winner = true
  elsif scores[:computer] == WINNING_MATCH || scores[:player] != WINNING_MATCH
    grand_winner = false
  end

  grand_winner
end

def display_end_of_game
  prompt(messages('game_over'))
end

def display_grand_winner(winner)
  if winner
    prompt(messages('player_won'))
  else
    prompt(messages('computer_won'))
  end
end

def play_again?
  prompt(messages('another_round'))
  gets.chomp
end

# BEGINNING
clear_screen
display_instructional_greeting
prompt_user_to_begin
clear_screen
# MAIN LOOP
loop do
  scoreboard = initialize_score

  loop do
    player_choice = retrieve_player_choice
    computer_choice = retrieve_computer_choice
    clear_screen
    display_choices(player_choice, computer_choice)
    winner_of_round = validate_winner_of_round(player_choice, computer_choice)
    display_winner_of_round(player_choice, computer_choice, winner_of_round)
    increment_score(winner_of_round, scoreboard)
    display_incrementing_score(scoreboard)
    break if game_over?(scoreboard)
  end

  grand_winner = establish_grand_winner(scoreboard)
  clear_screen
  display_end_of_game
  display_grand_winner(grand_winner)
  another_round = play_again
  break if another_round.downcase != 'y'
end

clear_screen
prompt(messages('goodbye'))
