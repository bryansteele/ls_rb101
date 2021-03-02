WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
  [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
]
WINNING_MATCH = 2
BEST_SQUARE = 5
INITIAL_MARKER = " "
PLAYER_MARKER = "𝙓"
COMPUTER_MARKER = "O"

def prompt(msg)
  puts "➣  #{msg}"
end

def display_instructional_greeting
  clear_screen
  puts <<-MSG
⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
            ➣ Welcome to TIC-TAC-TOE!

  • First one to get 3 in a row wins the round.
  • First one to win #{WINNING_MATCH} rounds is the GRAND CHAMPION!!!

          ➣ You are: #{PLAYER_MARKER}   Computer is: #{COMPUTER_MARKER}
⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼
            MSG
end

def display_emptyline
  puts ""
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_gameboard(brd)
  clear_screen
  puts "🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻"
  puts "        🔹YOU ARE: #{PLAYER_MARKER}\
      🔸COMPUTER IS: #{COMPUTER_MARKER}"
  puts "🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺"
  display_emptyline
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
  display_emptyline
  puts "🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺"
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_scoreboard(scores)
  puts "🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻"
  display_emptyline
  puts "🔹YOUR SCORE: #{scores[:player]}\
    🔸COMPUTER SCORE: #{scores[:computer]}".center(49)
  display_emptyline
  puts "🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺"
  display_emptyline
end

def clear_screen
  system("clear") || system("clr")
end

def valid_enter_key?(key)
  key == "\n"
end

def exit_game?(str)
  str << "YES"
end

def enter_to_continue(quit_str)
  counter = 0
  loop do
    key = gets
    break if valid_enter_key?(key)
    clear_screen

    if counter <= 1
      prompt "INVALID KEY! Please press |ENTER ⏎ |."
    else
      prompt "EXITING in 2 seconds."
      sleep(2)
      exit_game?(quit_str)
      break
    end

    counter += 1
  end
end

def hit_enter_prompt
  display_emptyline
  puts "         ➣  Press |ENTER ⏎ | to continue."
  display_emptyline
  display_emptyline
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
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "Who goes first?"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  sleep(2)
  clear_screen
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
  prompt "You or the Computer? ENTER (P)layer or (C)omputer:"
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end

def valid_first_player?(choice)
  %w(c p).include?(choice)
end

def retreive_first_player
  answer = ""
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

def add_or(arr, delimiter=", ", word="or")
  case arr.size
  when 0 then ""
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

def valid_number?(num)
  %w(1 2 3 4 5 6 7 8 9).include?(num)
end

def the_play!(brd, current_player)
  current_player == "player" ? player_turn!(brd) : computer_turn!(brd)
end

def player_turn!(brd)
  square = ""
  loop do
    puts "🔷 CHOOSE A SQUARE: #{add_or(empty_squares(brd))}."
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) && valid_number?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square.to_i] = PLAYER_MARKER
end

def alternating_players(turn)
  turn == "player" ? "computer" : "player"
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_offense_defense(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end

  square
end

def computer_turn!(brd)
  prompt "Computer's Turn:"
  sleep(0.5)
  square = computer_offense_defense(brd, COMPUTER_MARKER)

  if !square
    square = computer_offense_defense(brd, PLAYER_MARKER)
  end

  if !square
    square = if empty_squares(brd).include?(BEST_SQUARE)
               BEST_SQUARE
             else
               empty_squares(brd).sample
             end
  end

  brd[square] = COMPUTER_MARKER
  sleep(0.5)
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
      winner[0] = "player"
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      winner[0] = "computer"
      return "computer"
    else
      winner[0] = "tie"
    end
  end

  nil
end

def set_round_winner(_, winner)
  winner[0] = case winner[0]
              when "player"   then "player"
              when "computer" then "computer"
              else                 "tie"
              end

  winner.join("")
end

def display_round_winner(winner)
  clear_screen
  puts "🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷"
  display_emptyline
  case winner[0]
  when "player"   then puts "🔷            YOU WON THIS ROUND!!              🔷"
  when "computer" then puts "🔶         THE COMPUTER WON THIS TIME!!         🔷"
  else                 puts "🔶           TIE! LET'S DO THIS AGAIN.          🔷"
  end
  display_emptyline
  puts "🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶"
  display_emptyline
end

def increment_score(winner, scores)
  scores[:player] += 1   if winner[0] == "player"
  scores[:computer] += 1 if winner[0] == "computer"
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
  puts "🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻"
  display_emptyline
  puts "GAME OVER!".center(50)
  display_emptyline
  puts "🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺🔺"
end

def display_grand_winner(winner)
  if winner
    puts "🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷"
    display_emptyline
    puts "YOU ARE the GRAND CHAMPION! CONGRATULATIONS!".center(50)
    display_emptyline
    puts "🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶"
  else
    puts "🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶"
    display_emptyline
    puts "The computer is the GRAND CHAMPION!".center(50)
    puts "   ...Better Luck Next Time...".center(46)
    display_emptyline
    puts "🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷🔷"
  end
end

def play_again?
  clear_screen
  prompt "Would you like to play again? (Y/y to play again):"
  gets.chomp
end

def display_bye
  display_emptyline
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷"
  puts "🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶  THANK YOU   🔶🔷🔶🔷🔶🔷🔶🔷🔶"
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷     FOR      🔷🔶🔷🔶🔷🔶🔷🔶🔷"
  puts "🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶   PLAYING!   🔶🔷🔶🔷🔶🔷🔶🔷🔶"
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷"
  sleep(2)
  clear_screen
  display_emptyline
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷"
  puts "🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶              🔶🔷🔶🔷🔶🔷🔶🔷🔶"
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷  GOOD BYE!!  🔷🔶🔷🔶🔷🔶🔷🔶🔷"
  puts "🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶              🔶🔷🔶🔷🔶🔷🔶🔷🔶"
  puts "🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷🔶🔷"
end

# #########################################################################
# BEGINNING
round_winner = []
quit_str = ""
clear_screen
display_instructional_greeting
hit_enter_prompt
enter_to_continue(quit_str)
clear_screen

##########################################################################
# MAIN LOOP
while quit_str == ""
  scoreboard = initialize_score
  current_player = sets_current_player(retreive_first_player)

  loop do
    gameboard = initialize_gameboard

    loop do
      display_gameboard(gameboard)
      the_play!(gameboard, current_player)
      current_player = alternating_players(current_player)
      break if someone_won?(gameboard, "") || board_full?(gameboard)
    end

    set_round_winner(detect_winner(gameboard, round_winner), round_winner)
    increment_score(round_winner, scoreboard)
    display_gameboard(gameboard)
    sleep(1.4)
    display_round_winner(round_winner)
    sleep(2)
    display_round_winner(round_winner)
    display_scoreboard(scoreboard)
    sleep(1.4)
    hit_enter_prompt
    enter_to_continue(quit_str)
    break if game_over?(scoreboard)
  end

  grand_winner = establish_grand_winner(scoreboard)
  clear_screen
  display_end_of_game
  display_grand_winner(grand_winner)
  sleep(1.4)
  hit_enter_prompt
  enter_to_continue(quit_str)
  another_round = play_again?
  break if another_round.downcase != "y"
end

clear_screen
display_bye
sleep(2)
clear_screen
