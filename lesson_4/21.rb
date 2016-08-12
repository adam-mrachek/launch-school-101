SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
MAX_POINTS = 21
DEALER_STAY_POINTS = 17
WINNING_SCORE = 5

def clear_screen
  system('cls') || system('clear')
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def prompt(msg)
  puts ">>> #{msg}"
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i.zero?
             10
           else
             value.to_i
           end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_POINTS
  end

  sum
end

def busted?(cards)
  total(cards) > MAX_POINTS
end

def deal_hand(deck, player, dealer)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def display_cards(player, dealer)
  prompt "You have: #{player} for a total of #{total(player)}"
  prompt "Dealer is showing: #{dealer[1][1]}"
end

def determine_result(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)
  result = if player_total > MAX_POINTS
             "Player busted. Dealer wins the hand!"
           elsif dealer_total > MAX_POINTS
             "Dealer busted. Player wins the hand!"
           elsif player_total > dealer_total
             "Player wins!"
           elsif dealer_total > player_total
             "Dealer wins!"
           else
             "It's a push!"
           end
  result
end

def display_result(player, dealer)
  prompt determine_result(player, dealer).to_s
  prompt "You had #{player} for a total of #{total(player)}"
  prompt "Dealer had #{dealer} for a total of #{total(dealer)}"
end

def determine_winner(player, dealer)
  result = determine_result(player, dealer)
  if result.include?('Player wins')
    "player"
  elsif result.include?('Dealer wins')
    "dealer"
  end
end

def update_score(player, dealer, score)
  winner = determine_winner(player, dealer)
  if winner == "player"
    score[:player] += 1
  elsif winner == "dealer"
    score[:dealer] += 1
  end
end

def display_score(score)
  prompt "Current Score:"\
      " You: #{score[:player]}."\
      " Dealer: #{score[:dealer]}."
end

def display_game_winner(score)
  if score[:player] == WINNING_SCORE
    puts "***** YOU WON THE GAME! *****"
  elsif score[:dealer] == WINNING_SCORE
    puts "***** Sorry, the dealer won the game. *****"
  end
end

def play_again?
  prompt "Play another game?"
  loop do
    answer = gets.chomp.downcase
    if answer.start_with?('y')
      break true
    elsif answer.start_with?('n')
      break false
    else
      prompt "Please enter a 'y' or 'n'."
    end
  end
end

loop do
  score = {
    player: 0,
    dealer: 0
  }

  clear_screen

  puts ""
  puts "--> Let's play #{MAX_POINTS}! <--".center(50)
  puts "----------------------".center(50)
  puts ""

  loop do
    game_deck = initialize_deck
    player_hand = []
    dealer_hand = []

    loop do
      deal_hand(game_deck, player_hand, dealer_hand)
      display_cards(player_hand, dealer_hand)

      # players turn
      loop do
        answer = ''
        loop do
          prompt "(H)it or (S)tay"
          answer = gets.chomp.downcase
          break if answer == 'h' || answer == 's'
          prompt "Please enter 'h' or 's'."
        end

        clear_screen

        if answer == 'h'
          prompt "You chose to hit and were dealt a #{game_deck.last}"
          player_hand << game_deck.pop
          break if busted?(player_hand)
          display_cards(player_hand, dealer_hand)
        end

        break if answer == 's'
      end

      if busted?(player_hand)
        display_result(player_hand, dealer_hand)
        break
      end

      prompt "You chose to stay."

      # dealer turn
      loop do
        dealer_total = total(dealer_hand)
        if busted?(dealer_hand)
          break
        elsif dealer_total >= DEALER_STAY_POINTS
          break
        elsif dealer_total < DEALER_STAY_POINTS
          prompt "Dealer has #{dealer_hand} for a total of #{dealer_total}"
          prompt "Press enter to see dealer's next card."
          gets
          prompt "Dealer was dealt: #{game_deck.last}"
          dealer_hand << game_deck.pop
        end
      end

      display_result(player_hand, dealer_hand)

      break
    end

    puts "..."
    update_score(player_hand, dealer_hand, score)
    display_score(score)
    puts ""
    display_game_winner(score)
    prompt "Press enter to continue"
    gets
    clear_screen
    break if score.value?(WINNING_SCORE)
  end

  puts ""
  break unless play_again?
end

prompt "Thanks for playing!"
