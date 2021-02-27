# require 'yaml'

# MESSAGES = YAML.load_file('ttt_msgs.yml')
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
WINNING_MATCH = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = '𝙓'
COMPUTER_MARKER = 'O'

def clear_screen
  system('clear') || system('clr')
end

# def messages(msg)
#   MESSAGES[msg]
# end

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
  ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
          ➣  Please press |ENTER ⏎ | to begin.
  ⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
  MSG
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

def first_player_prompt
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "Who goes first?"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  sleep(2)
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "You or the computer? ENTER (C)omputer or (P)layer:"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"

  retreive_first_player(gets.chomp)
end

def valid_first_player?(choice)
  %w(c p).include?(choice.downcase)
end

def retreive_first_player(answer)
  loop do
  break if answer == valid_first_player?(answer)
  puts "Invalid Input! Please ENTER C or P"
  end

  answer
end

def initialize_score
  { player: 0, computer: 0}
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_game_board(brd)
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  puts "🔹You're: #{PLAYER_MARKER}   🔸Computer is: #{COMPUTER_MARKER}".center(44)
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  puts ""
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[1]}     |     #{brd[2]}     |     #{brd[3]}"
  puts "                 |           |"
  puts "                𝟙|          𝟚|          𝟛"
  puts "      -----------+-----------+-----------"
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[4]}     |     #{brd[5]}     |     #{brd[6]}"
  puts "                 |           |"
  puts "                𝟜|          𝟝|          𝟞"
  puts "      -----------+-----------+-----------"
  puts "                 |           |"
  puts "                 |           |"
  puts "           #{brd[7]}     |     #{brd[8]}     |     #{brd[9]}"
  puts "                 |           |"
  puts "                𝟟|          𝟠|          𝟡"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_game_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end
# #########################################################################
# BEGINNING
quit_str = ''
clear_screen
display_instructional_greeting
enter_to_begin(quit_str)
clear_screen

##########################################################################
# MAIN LOOP
while quit_str == '' do
  scoreboard = initialize_score
  game_board = initialize_game_board
  
  # loop do
    first_player_prompt
    first_player = retreive_first_player
  
    p first_player
    # display_game_board(game_board)
    break
  #   player_places_piece!(board)
  #   break if someone_won?(board) || board_full?(board)

  #   computer_places_piece!(board)
  #   break if someone_won?(board) || board_full?(board)
  # end

  # display_board(board)

  # if someone_won?(board)
  #   prompt "#{detect_winner(board)} won!"
  # else
  #   prompt "It's a tie!"


  # prompt "Play again? (y or n)"
  # answer = gets.chomp
  # break unless answer.downcase.start_with?('y')
end

# prompt "GOOD BYE!"
