require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
PLAYER_ORDER = 'choose'.freeze
WINNING_SCORE = 5

def prompt(msg)
  puts ">>> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  if arr.size == 2
    arr.join(' ')
  else
    arr.join(delimiter)
  end
end

def choose_first_player
  prompt "Who should go first? Enter 'P' for player or 'C' for computer."
  choice = ''
  loop do
    choice = gets.chomp.downcase
    if choice == 'p' || choice == 'c'
      break
    else
      prompt "Please choose 'P' or 'C'."
    end
  end
  if choice == 'p'
    'player'
  elsif choice == 'c'
    'computer'
  end
end

def second_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
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

def find_at_risk_square(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |num| brd[num] == INITIAL_MARKER }.first
    end
  end
  nil
end

def place_center_square(brd)
  5 if brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  square = find_at_risk_square(brd, COMPUTER_MARKER) ||
           find_at_risk_square(brd, PLAYER_MARKER) ||
           place_center_square(brd) ||
           empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def display_round_result(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won the round!"
  else
    prompt "It's a tie!"
  end
end

def update_scores(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    score[:computer] += 1
  end
end

def display_score(score)
  prompt "Current Score:"\
      " You: #{score[:player]}."\
      " Computer: #{score[:computer]}."
end

def display_winning_player(score)
  if score[:player] == WINNING_SCORE
    puts "***** YOU WON THE GAME! *****"
  elsif score[:computer] == WINNING_SCORE
    puts "***** Sorry, the computer won the game. *****"
  end
end

def play_again?
  prompt "Would you like to play again? (y/n)"
  loop do
    answer = gets.chomp.downcase
    if answer.start_with?('y')
      break true
    elsif answer.start_with?('n')
      break false
    else
      prompt "Please enter 'y' or 'n'."
    end
  end
end

loop do
  score = {
    player: 0,
    computer: 0
  }

  system 'clear'

  puts ""
  puts "--> Let's play Tic Tac Toe! <--".center(60)
  puts "** First player to win 5 matches wins the game. **".center(60)
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(60)
  puts ""
  puts ">>> Press 'Enter' to begin the game. <<<".center(60)
  gets

  first_player = if PLAYER_ORDER == 'choose'
                   choose_first_player
                 else
                   PLAYER_ORDER
                 end

  loop do
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board)
      display_score(score)
      place_piece!(board, current_player)
      current_player = second_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_round_result(board)
    update_scores(board, score)

    puts "..."

    display_winning_player(score)
    break if score.value?(WINNING_SCORE)

    display_score(score)
    prompt "Press 'Enter' to begin next round."
    gets
  end

  break unless play_again?
  # prompt "Play again? (y/n)"
  # answer = gets.chomp.downcase
  # break unless answer.start_with?('y')
end

prompt "Thanks for playing TicTacToe!  Good Bye."
