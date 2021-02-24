require 'yaml'

MESSAGES = YAML.load_file('ttt_msgs.yml')
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]
WINNING_MATCH = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = '𝙓'
COMPUTER_MARKER = 'O'

def clear
  system('clear') || system('clr')
end

def messages(msg)
  MESSAGES[msg]
end

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  clear
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "           |           |"
  puts "           |           |"
  puts "     #{brd[1]}     |     #{brd[2]}     |     #{brd[3]}"
  puts "           |           |"
  puts "          𝟙|          𝟚|          𝟛"
  puts "-----------+-----------+-----------"
  puts "           |           |"
  puts "           |           |"
  puts "     #{brd[4]}     |     #{brd[5]}     |     #{brd[6]}"
  puts "           |           |"
  puts "          𝟜|          𝟝|          𝟞"
  puts "-----------+-----------+-----------"
  puts "           |           |"
  puts "           |           |"
  puts "     #{brd[7]}     |     #{brd[8]}     |     #{brd[9]}"
  puts "           |           |"
  puts "          𝟟|          𝟠|          𝟡"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
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
loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! GOOD BYE!"
