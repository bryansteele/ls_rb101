WINNING_ROUNDS = 5
SUITS = %w(H D S C)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def clear_screen
  system('clear') || system('clr')
end

def display_empty_line
  puts ""
end

def prompt(msg)
  puts "=> #{msg}"
end

def start_program(str)
  clear_screen
  display_instructional_greeting
  hit_enter_prompt
  enter_to_continue(str)
  clear_screen
end

def display_instructional_greeting
  prompt "Welcome to Twenty-One!....."
end

def hit_enter_prompt
  display_empty_line
  puts "Press |ENTER ⏎ | to continue."
  display_empty_line
  display_empty_line
end

def valid_enter_key?(key)
  key == "\n"
end

def early_exit(str)
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
      early_exit(quit_str)
      break
    end

    counter += 1
  end
end

def initialize_score
  { player: 0, computer: 0 }
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end 

def initial_deal(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def display_hands(player_cards, dealer_cards)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def poker_hit(cards, deck)
  cards << deck.pop
end

def valid_player_choice?(choice_received)
  %w(h s).include?(choice_received)
end

def retrieve_player_choice
  prompt "Would you like to (H)it or (S)tay?"
  choice = ''

  loop do
    choice = gets.chomp.downcase
    break if valid_player_choice?(choice)
    prompt"Sorry, must enter 'h' or 's'."
  end

  choice
end

def player_turn(player_cards, deck)
  if player_choice == 'h'
    poker_hit(player_cards, deck)
    display_player_hit(player_cards)
  else
    display_stay_total("You stayed", player_cards)
  end
end

def display_player_hit(player_cards)
  prompt "You chose to hit!"
  prompt "Your cards are now: #{player_cards}"
  prompt "Your total is now: #{total(player_cards)}"
end

def display_stay_total(participant, cards)
  prompt "You stayed at #{total(cards)}"
end

def busted?(cards)
  total(cards) > 21
end

def dealer_prompt
  prompt "Dealer turn..."
end

def dealer_hit_prompt
  prompt "Dealer hits!"
end

def display_dealer_hand(dealer_cards)
  prompt "Dealer's cards are now: #{dealer_cards}"
end

def dealer_turn(dealer_cards, deck)
  if !busted?(dealer_cards)
    dealer_hit_prompt
    poker_hit(dealer_cards, deck)
    display_dealer_hand(dealer_cards)
  else
    display_stay_total("Dealer stays", player_cards)
  end
end

def both_participants_stay(dealer_cards, player_cards)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end

def validate_round_result(player, dealer)
  if player > 21
    :player_busted
  elsif dealer > 21
    :dealer_busted
  elsif dealer < player
    :player
  elsif dealer > player
    :dealer
  else
    :tie
  end
end

def display_round_result(result)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def set_round_winner(result)
  if result == :player_busted || :dealer
    :dealer
  elsif result == :dealer_busted || :player
    :player
  end
end

def increment_score(round_winner, scores)
  if round_winner == :player
    scores[:player] += 1
  elsif round_winner == :dealer
    scores[:dealer] += 1
  end
end

def display_incrementing_score(scores)
  prompt("Your Score: #{scores[:player]} Dealer's Score: #{scores[:dealer]}\n \n ")
end

def game_over?(scores)
  scores[:player] == WINNING_ROUNDS || scores[:dealer] == WINNING_ROUNDS
end

def establish_grand_winner(scores)
  if scores[:player] == WINNING_ROUNDS && scores[:dealer] != WINNING_ROUNDS
    grand_winner = true
  elsif scores[:computer] == WINNING_ROUNDS && scores[:player] != WINNING_ROUNDS
    grand_winner = false
  end

  grand_winner
end

def display_end_of_game
  prompt "GAME OVER!\n \n"
end

def display_grand_winner(winner)
  if winner
    prompt "YOU ARE the GRAND CHAMPION! CONGRATULATIONS!\n \n"
  else
    prompt "THE DEALER IS THE GRAND CHAMPION! Better Luck Next Time.\n \n "
  end
end

def valid_answer?(answer)
  %w(y n).include?(answer)
end

def play_again
  answer = ''

  loop do
    prompt "Would you like to play again? Y/N"
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt "INVALID ENTRY! Please Enter Y/N"
  end

  answer
end

# BEGINNING
quit_str = ''
start_program(quit_str)

# MAIN LOOP
while quit_str != "YES"
  scoreboard = initialize_score
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_deal(player_cards, dealer_cards, deck)
  display_hands(player_cards, dealer_cards)

  loop do
    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    loop do
      player_choice = retrieve_player_choice
      player_turn(player_cards, deck)
      break if player_choice == 's' || busted?(player_cards)
    end

    dealer_prompt

    while total(dealer_cards) < 17  && !busted?(player_cards)
      dealer_turn(dealer_cards, deck)
      break if busted?(dealer_cards)
    end

    both_participants_stay(dealer_cards, player_cards)
    round_result = validate_round_result(player_total, dealer_total)
    round_winner = set_round_winner(round_result)
    display_round_result(round_result)
    increment_score(round_winner, scoreboard)
    display_incrementing_score(scoreboard)
    break if game_over?(scoreboard)
  end

  grand_winner = establish_grand_winner(scoreboard)
  clear_screen
  display_end_of_game
  display_grand_winner(grand_winner)
  break if play_again != 'y'
end

clear_screen
prompt "Thank you for playing 21 ...GOODBYE!\n \n"