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

def display_empty_line
  puts ""
end

def display_solid_line
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end

def display_welcome
  clear_screen
  display_solid_line
  puts "➣ Welcome to TIC-TAC-TOE!".center(50)
  display_empty_line
  puts "➣ Would you like to play a single round or a tournament?".center(50)
  display_solid_line
  display_empty_line
  puts "|ENTER ⏎ | (S)ingle or (T)ournament".center(50)
end

def new_game_type
  clear_screen
  display_empty_line
  display_solid_line
  display_empty_line
  puts "➣ Would you like to play a single round,".center(50)
  puts "...or a tournament?".center(50)
  display_empty_line
  display_solid_line
  display_empty_line
  puts "|ENTER ⏎ | (S)ingle or (T)ournament".center(50)
end

def valid_game_entry?(entry)
  %w(s t).include?(entry)
end

def retrieve_game_type
  game = ''
  loop do
    game = gets.chomp.downcase
    break if valid_game_entry?(game)
    prompt "INVALID ENTRY! Please enter an 'S' or 'T'"
  end

  game
end

def retrieve_instructional_greeting(type, quit_str)
  if type == "s"
    display_single_round_greeting(quit_str)
  else
    display_tournament_greeting(quit_str)
  end
end

def display_single_round_greeting(quit_str)
  clear_screen
  display_empty_line
  puts "➣ Welcome to TIC-TAC-TOE! This is a Single Round".center(50)
  display_empty_line
  puts "  • First one to get 3 in a row wins the round."
  display_solid_line
  puts "➣ You are: #{PLAYER_MARKER}  Computer is: #{COMPUTER_MARKER}".center(50)
  display_empty_line
  hit_enter_prompt
  enter_to_continue(quit_str)
end

def display_tournament_greeting(quit_str)
  clear_screen
  display_solid_line
  puts "➣ Welcome to the TIC-TAC-TOE TOURNAMENT!".center(50)
  display_empty_line
  puts "  • First one to get 3 in a row wins the round."
  puts "  • First one to win #{WINNING_MATCH} rounds is the GRAND CHAMPION!!!"
  display_solid_line
  puts "➣ You are: #{PLAYER_MARKER}  Computer is: #{COMPUTER_MARKER}".center(50)
  display_empty_line
  hit_enter_prompt
  enter_to_continue(quit_str)
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_gameboard(brd)
  clear_screen
  display_solid_line
  puts "        ➣ YOU ARE: #{PLAYER_MARKER}\
    ➣ COMPUTER IS: #{COMPUTER_MARKER}"
  display_solid_line
  display_empty_line
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
  display_empty_line
  display_solid_line
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_scoreboard(scores, quit_str)
  display_solid_line
  display_empty_line
  puts "➣ YOUR SCORE: #{scores[:player]}\
    ➣ COMPUTER SCORE: #{scores[:computer]}".center(50)
  display_empty_line
  display_solid_line
  display_empty_line
  hit_enter_prompt
  enter_to_continue(quit_str)
end

def clear_screen
  system("clear") || system("clr")
end

def valid_enter_key?(key)
  key == "\n"
end

def exit_game?(str)
  str << "YES"
  clear_screen
  prompt "GOOD BYE!"
  sleep(1.5)
  clear_screen
  exit
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
  display_empty_line
  puts "Press |ENTER ⏎ | to continue.".center(52)
  display_empty_line
  display_empty_line
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
  sleep(1.75)
  clear_screen
  display_solid_line
  prompt "You or the Computer? ENTER (P)layer or (C)omputer:"
  display_solid_line
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
    puts "➣ CHOOSE A SQUARE: #{add_or(empty_squares(brd))}."
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

def set_round_winner(winner)
  winner[0] = case winner[0]
              when "player"   then "player"
              when "computer" then "computer"
              else                 "tie"
              end

  winner.join("")
end

def display_round_winner(winner)
  clear_screen
  display_solid_line
  display_empty_line
  case winner[0]
  when "player"   then puts "➣ YOU WON THIS ROUND!!".center(50)
  when "computer" then puts "➣ THE COMPUTER WON THIS TIME!!".center(50)
  else                 puts "➣ TIE! LET'S DO THIS AGAIN.".center(50)
  end
  display_empty_line
  display_solid_line
  display_empty_line
end

def increment_score(winner, scores)
  scores[:player] += 1   if winner[0] == "player"
  scores[:computer] += 1 if winner[0] == "computer"
end

def game_play(gameboard, current_player)
  loop do
    display_gameboard(gameboard)
    the_play!(gameboard, current_player)
    current_player = alternating_players(current_player)
    break if someone_won?(gameboard, "") || board_full?(gameboard)
  end
end

def start_game_play(current_player, scorebrd, quit_str, game_type)
  round_winner = []

  loop do
    gameboard = initialize_gameboard
    game_play(gameboard, current_player, )
    detect_winner(gameboard, round_winner)
    set_round_winner(round_winner)
    increment_score(round_winner, scorebrd)
    display_gameboard(gameboard)
    sleep(1.4)
    display_round_winner(round_winner)
    sleep(1.75)
    display_round_winner(round_winner)
    display_scoreboard(scorebrd, quit_str) if game_type != "s"
    
    # extract more to methods and fix the displaying of the correct grand winner
    if game_over?(scorebrd)
      display_end_of_tournament(round_winner, quit_str)
      hit_enter_prompt
      enter_to_continue(quit_str)
      break
    elsif game_type == "s"
      clear_screen
      display_end_of_tournament(round_winner, quit_str)
      break
    end
  end
end

def game_over?(scores)
  scores[:player] == WINNING_MATCH || scores[:computer] == WINNING_MATCH
end

def establish_grand_winner(scores)
  grand_winner = nil
  if scores[:player] == WINNING_MATCH && scores[:computer] != WINNING_MATCH
    grand_winner = true
  elsif scores[:computer] == WINNING_MATCH || scores[:player] != WINNING_MATCH
    grand_winner = false
  end

  grand_winner
end

def establish_game_ending(scores, winner, game_type)
  if game_type == "t"
    establish_grand_winner(scores)
  end
end

def display_end_of_tournament(winner, quit_str)
  clear_screen
  display_game_over(quit_str)
  display_grand_winner(winner)
end

def display_grand_winner(winner)
  clear_screen
  display_solid_line
  display_empty_line
  if winner
    puts "YOU ARE the GRAND CHAMPION! CONGRATULATIONS!".center(50)
  else
    puts "The computer is the GRAND CHAMPION!".center(50)
    puts "•••Better Luck Next Time•••".center(50)
  end
  display_empty_line
  display_solid_line
  display_empty_line
end

def display_game_over(quit_str)
  display_solid_line
  display_empty_line
  puts "GAME OVER!".center(50)
  display_empty_line
  display_solid_line
  hit_enter_prompt
  enter_to_continue(quit_str)
end

def valid_play_again?(answer)
  %w(y n).include?(answer)
end

def play_again?
  clear_screen
  answer = ''
  prompt "Would you like to play again? (Y/N to play again):"

  loop do
    answer = gets.chomp.downcase
    break if valid_play_again?(answer)
    prompt "INVALID INPUT! Enter Y or N"
  end

  answer
end

def display_thank_you
  clear_screen
  display_empty_line
  display_solid_line
  puts "THANK YOU".center(50)
  puts "FOR".center(50)
  puts "PLAYING!".center(50)
  display_solid_line
  sleep(2)
end

def display_bye
  clear_screen
  display_empty_line
  display_solid_line
  puts "GOOD BYE!!".center(50)
  display_solid_line
  sleep(2)
  clear_screen
end

# BEGINNING
quit_str = ""
display_welcome

# MAIN LOOP
loop do
  game_type = retrieve_game_type
  retrieve_instructional_greeting(game_type, quit_str)
  scoreboard = initialize_score
  current_player = sets_current_player(retreive_first_player)

  start_game_play(current_player, scoreboard, quit_str, game_type)

  another_round = play_again?
  break if another_round.downcase != "y"
  new_game_type
end

display_thank_you
display_bye
