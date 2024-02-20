require 'yaml'

MESSAGES = YAML.load_file('rock_paper_scissors_msgs.yaml')

def prompt(message)
  puts("=> #{message}")
end

PLAYER_MOVE = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

def win?(first, second)
  (first == 'r' && (second == 'sc' || second == 'l')) ||
    (first == 'p' && (second == 'r' || second == 'sp')) ||
    (first == 'sc' && (second == 'p' || second == 'l')) ||
    (first == 'l' && (second == 'sp' || second == 'p')) ||
    (first == 'sp' && (second == 'r' || second == 'sc'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("You tied this round!")
  end
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ''
    loop do
      prompt(MESSAGES['choose'])
      choice = gets.chomp.downcase
      if PLAYER_MOVE.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = PLAYER_MOVE.keys.sample

    puts("You chose: #{PLAYER_MOVE.fetch(choice).capitalize}; Computer chose:
          #{PLAYER_MOVE.fetch(computer_choice).capitalize}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    prompt("The score is: Player: #{player_wins}, Computer #{computer_wins}")

    if player_wins == 3
      puts "You won the game!"
      break
    elsif computer_wins == 3
      puts "Computer won the game."
      break
    end
  end

  prompt("Do you want to play again?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
