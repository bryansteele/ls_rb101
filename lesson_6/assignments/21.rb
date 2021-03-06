require 'pry'

SUITS = %w(H D S C)
VALUES = %w(2 3 4 5 6 7 8 9 J Q K A)

def prompt(msg)
  puts "=> #{msg}"
end

def display_empty_line
  puts ""
end

def display_solid_line
  puts "⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼⎼"
end

def clear_screen
  system("clear") || system("clr")
end

def welcome_prompt
  prompt "Welcome to Twenty-One!"
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

def display_initial_deal(player_cards, dealer_cards)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]},\
  for a total of #{total(player_cards)}."
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def valid_hit_stay?(choice)
  %w(h s).include?(choice)
end

def player_hit_or_stay(choice)
  prompt "Would you like to (h)it or (s)tay?"
  loop do
    choice[0] = gets.chomp.downcase
    break if valid_hit_stay?(choice[0])
    prompt "Sorry, must enter 'h' or 's'."
  end

  choice
end

def start_player_turn(deck, player_cards)
  loop do
    player_turn = []

    player_hit_or_stay(player_turn)

    if player_turn == ['h']
      player_cards << deck.pop
      display_player_result(player_cards)
    end

    break if player_turn == ['s'] || busted?(player_cards)
  end
end

def display_player_result(player_cards)
  prompt "You chose to hit!"
  prompt "Your cards are now: #{player_cards}"
  prompt "Your total is now: #{total(player_cards)}"
end

def player_busts?(player_cards, dealer_cards)
  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again
  else
    prompt "You stayed at #{total(player_cards)}"
  end
end

def start_dealer_turn(deck, dealer_cards)
  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end
end

def busted?(cards)
  total(cards) > 21
end

# def dealer_busts?(player_cards, dealer_cards)
#   if busted?(dealer_cards)
#     prompt "Dealer total is now: #{total(dealer_cards)}"
#     # display_result(dealer_cards, player_cards)
#     play_again
#   else
#     prompt "Dealer stays at #{total(dealer_cards)}"
#   end
# end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player        then prompt "You win!"
  when :dealer        then prompt "Dealer wins!"
  when :tie           then prompt "It's a tie!"
  end
end

def compare_hands(dealer_cards, player_cards)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end

def valid_answer?(answer)
  %w(y n).include?(answer)
end

def play_again
  # clear_screen
  answer = ''

  loop do
    prompt "Would you like to play again? Y/N:"
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt "INVALID ENTRY! Please Enter Y/N"
  end

  answer
end

def display_goodbye
  prompt "Thank you for playing Twenty-One! Good bye!"
end
##########################################################BEGINING#############
loop do
  welcome_prompt
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_deal(player_cards, dealer_cards, deck)
  display_initial_deal(player_cards, dealer_cards)

  start_player_turn(deck, player_cards)
  # player_busts?(player_cards, dealer_cards)

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again != "n" ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  start_dealer_turn(deck, dealer_cards)
  # dealer_busts?(player_cards, dealer_cards)
  
  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again != "n" ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  compare_hands(dealer_cards, player_cards)  
  display_result(dealer_cards, player_cards)

  break if play_again == "n"
end

display_goodbye
