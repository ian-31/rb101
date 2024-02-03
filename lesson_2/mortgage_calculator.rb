# mortgage calculator

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_loan?(amount)
  amount.to_f > 1.00
end

def valid_rate?(rate)
  rate.to_f >= 0
end

def valid_term?(term)
  term / 12 >= 1
end

def get_loan_amount
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.to_f

    return loan_amount if valid_loan?(loan_amount)
    prompt(MESSAGES['valid_loan'])
  end
end

def get_interest_rate
  loop do
    prompt(MESSAGES['interest_rate'])
    interest_rate = gets.chomp.to_f / 100

    return interest_rate if valid_rate?(interest_rate)
    prompt(MESSAGES['valid_rate'])
  end
end

def get_loan_term
  loop do
    prompt(MESSAGES['loan_term'])
    loan_term = gets.chomp.to_f

    return loan_term if valid_term?(loan_term)
    prompt(MESSAGES['valid_term'])
  end
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['name_input'])

name = ''
loop do
  name = gets.chomp.capitalize

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}! Let's calculate your loan payment.")

loop do
  loan_amount = get_loan_amount
  interest_rate = get_interest_rate
  loan_term = get_loan_term

  if interest_rate == 0
    monthly_payment = loan_amount / loan_duration
  else
    monthly_payment =
      loan_amount *
      ((interest_rate / 12) / (1 - ((1 + (interest_rate / 12))**(-loan_term))))
  end

  prompt("Your monthly payment is $#{monthly_payment.round(2)}.")

  prompt(MESSAGES['another_calculation'])

  go_again = gets.chomp.downcase
  break unless go_again.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
