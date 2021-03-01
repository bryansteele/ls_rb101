require 'pry'

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
  [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
]
WINNING_MATCH = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = '𝙓'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "➣  #{msg}"
end

def display_instructional_greeting
  clear_screen
  puts <<-MSG
  ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
              ➣  Welcome to TIC-TAC-TOE!

    • First one to get 3 in a row wins the round.
    • First one to win 5 rounds is the GRAND CHAMPION!!!

              ➣  You are: 𝙓     I am: O

  ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
          ➣  Please press |ENTER ⏎ | to begin.
  ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
  MSG
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_gameboard(brd)
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  puts "🔹You are: #{PLAYER_MARKER}   🔸I am: #{COMPUTER_MARKER}".center(44)
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  puts ""
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[1]}     |     #{brd[2]}     |     #{brd[3]}"
  puts "                 |           |"
  puts "               𝟙.|         𝟚.|         𝟛."
  puts "      -----------+-----------+-----------"
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[4]}     |     #{brd[5]}     |     #{brd[6]}"
  puts "                 |           |"
  puts "               𝟜.|         𝟝.|         𝟞."
  puts "      -----------+-----------+-----------"
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[7]}     |     #{brd[8]}     |     #{brd[9]}"
  puts "                 |           |"
  puts "               𝟟.|         𝟠.|         𝟡."
  puts ""
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_scoreboard(scores)
  puts "🔹YOUR SCORE: #{scores[:player]}\
        🔸My SCORE: #{scores[:computer]}".center(45)
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end

def clear_screen
  system('clear') || system('clr')
end

def valid_enter_key?(key)
  key == "\n"
end

def exit_game?(str)
  str << 'YES'
end

def enter_to_begin(quit_str)
  counter = 0
  loop do
    key = gets
    break if valid_enter_key?(key)
    clear_screen

    if counter <= 1
      prompt "INVALID KEY! Please press |ENTER ⏎ | to begin."
    else
      prompt "EXITING in 2 seconds."
      sleep(2)
      exit_game?(quit_str)
      break
    end

    counter += 1
  end
end

def initialize_score
  { player: 0, computer: 0 }
end

def initialize_gameboard
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def first_player_prompt
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "Who goes first?"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  sleep(2)
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "You or the Me? ENTER (C)omputer or (P)layer:"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end

def valid_first_player?(choice)
  %w(c p).include?(choice)
end

def retreive_first_player
  answer = ''
  first_player_prompt

  loop do
    answer = gets.chomp.downcase
    break if valid_first_player?(answer)
    puts "Invalid Input! Please ENTER 'C' or 'P'"
  end

  answer
end

def sets_current_player(first_to_play)
  first_to_play == 'c' ? 'computer' : 'player'
end

def add_or(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def the_play!(brd, current_player)
  current_player == "player" ? player_turn!(brd) : computer_turn!(brd)
end

def player_turn!(brd)
  square = ''
  loop do
    puts "🔷 Choose a square #{add_or(empty_squares(brd))}."
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def alternating_players(turn)
  turn == 'player' ? 'computer' : 'player'
end

def computer_turn!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, winner)
  !!detect_winner(brd, winner)
end

def detect_winner(brd, winner)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      winner[0] = 'player'
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      winner[0] = "computer"
      return 'computer'
    else
      winner[0] = 'tie'
    end
  end

  nil
end

def set_round_winner(_, winner)
  case winner[0]
  when "player"   then winner[0] = 'player'
  when "computer" then winner[0] = 'computer'
  else                 winner[0] = 'tie'
  end

  winner.join('')
end

def display_round_winner(winner)
  case winner[0]
  when 'player'   then prompt "You won that round."
  when 'computer' then prompt "I won this round."
  else                 prompt "TIE! Let's do this again."
  end
end

def increment_score(winner, scores)
  scores[:player] += 1   if winner[0] == 'player'
  scores[:computer] += 1 if winner[0] == 'computer'
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
  prompt "GAME OVER!"
end

def display_grand_winner(winner)
  if winner
    prompt "YOU ARE the GRAND WINNER! CONGRATULATIONS!\n "
  else
    prompt "I AM the GRAND WINNER! Better Luck Next Time.\n \n "
  end
end

def play_again?
  clear_screen
  prompt "Would you like to play again? (Y/y to play again):"
  gets.chomp
end

# #########################################################################
# BEGINNING
round_winner = []
quit_str = ''
clear_screen
display_instructional_greeting
enter_to_begin(quit_str)
clear_screen

##########################################################################
# MAIN LOOP
while quit_str == ''
  scoreboard = initialize_score

  loop do
    gameboard = initialize_gameboard
    current_player = sets_current_player(retreive_first_player)

    loop do
      display_gameboard(gameboard)
      the_play!(gameboard, current_player)
      current_player = alternating_players(current_player)
      break if someone_won?(gameboard, '') || board_full?(gameboard)
    end

    set_round_winner(detect_winner(gameboard, round_winner), round_winner)
    increment_score(round_winner, scoreboard)
    display_gameboard(gameboard)
    display_scoreboard(scoreboard)
    display_round_winner(round_winner)
binding.pry
  #   break if game_over?(scoreboard)

  #   grand_winner = establish_grand_winner(scoreboard)
  #   clear_screen
  #   display_end_of_game
  #   display_grand_winner(grand_winner)
  #   another_round = play_again?
  #   break if another_round.downcase != 'y'
  end
  binding.pry
end

clear_screen
prompt "GOOD BYE!"
