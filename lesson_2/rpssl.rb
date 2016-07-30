VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

WINNING_COMBOS = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  spock: %w(scissors rock),
  lizard: %w(spock paper)
}

def prompt(message)
  puts ">>> #{message}"
end

def win?(first, second)
  WINNING_COMBOS[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You win the match!"
  elsif win?(computer, player)
    prompt "Computer won the match!"
  else
    prompt "It's a tie!"
  end
end

loop do
  score = {
    player: 0,
    computer: 0,
    ties: 0
  }

  system('cls') || system('clear')

  puts ""
  puts "--> Let's play Rock, Paper, Scissors, Spock, Lizard! <--".center(60)
  puts "** First player to win 5 matches wins the game. **".center(60)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(60)

  loop do
    choice = ''

    loop do
      prompt "Choose one: #{VALID_CHOICES.values.join(', ')}"
      prompt "Or choose: #{VALID_CHOICES.keys.join(', ')} for a quicker game."
      choice = gets.chomp.downcase

      if VALID_CHOICES.keys.include?(choice)
        choice = VALID_CHOICES[choice]
        break
      elsif VALID_CHOICES.values.include?(choice)
        break
      else
        prompt "That's not a valid choice."
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    system('cls') || system('clear')

    puts "You chose: #{choice.upcase};"\
         " Computer chose: #{computer_choice.upcase}"

    puts "..."

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      score[:player] += 1
    elsif win?(computer_choice, choice)
      score[:computer] += 1
    else
      score[:ties] += 1
    end

    prompt "Current Score:"\
           " You: #{score[:player]}."\
           " Computer: #{score[:computer]}."\
           " Ties: #{score[:ties]}."

    puts "..."

    if score[:player] == 5
      puts "***** YOU WON THE GAME! *****"
      break
    elsif score[:computer] == 5
      puts "***** Sorry, the computer won the game. *****"
      break
    end
  end

  puts ''
  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing!"
