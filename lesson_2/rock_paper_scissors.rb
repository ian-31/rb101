require 'yaml'

MESSAGES = YAML.load_file('rock_paper_scissors_msgs.yaml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || 'lizard')) ||
  (first == 'paper' && (second == 'rock' || 'spock')) ||
  (first == 'scissors' && (second == 'paper' || 'lizard')) ||
  (first == 'lizard' && (second == 'spock' || 'paper'))
  (first == 'spock' && (second == 'rock' || 'scissors')) ||
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt(MESSAGES['choose'])
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")


#change