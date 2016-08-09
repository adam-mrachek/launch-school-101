SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

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
    if value == "A"
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def deal_hand(deck, player, dealer)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def dealer_turn(total)
  loop do
    if total > 21
      puts "Dealer busted! You win!"
      break
    elsif total >= 17
      break
    elsif total < 17
      deal card
    end
  end
end

def display_cards(player, dealer)
  prompt "You have: #{player} for a total of #{total(player)}"
  prompt "Dealer is showing: #{dealer[1][1]}"
end

def determine_result(player, dealer)
  result = nil
  if total(player) > 21
    result = "Player busted. Dealer wins!"
  elsif total(dealer) > 21
    result = "Dealer busted. Player wins!"
  elsif total(player) > total(dealer)
    result = "Player wins!"
  elsif total(dealer) > total(player)
    result = "Dealer wins!"
  else
    result = "It's a push!"
  end
  result
end

def display_result(player, dealer)
  prompt "#{determine_result(player, dealer)}"
  prompt "You had #{player} for a total of #{total(player)}"
  prompt "Dealer had #{dealer} for a total of #{total(dealer)}"
end

def play_again?
  prompt "Play another hand?"
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
  game_deck = initialize_deck
  player_hand = []
  dealer_hand = []

  system 'clear'

  puts ""
  puts "--> Let's play 21! <--".center(50)
  puts "----------------------".center(50)
  puts ""

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

      system 'clear'

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
      if busted?(dealer_hand)
        break
      elsif total(dealer_hand) >= 17
        break
      elsif total(dealer_hand) < 17
        prompt "Dealer has #{dealer_hand} for a total of #{total(dealer_hand)}"
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
  break unless play_again?
end

prompt "Thanks for playing!"
