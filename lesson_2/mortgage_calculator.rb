# mortgage calculator

def prompt(message)
  puts "=> #{message}"
end

def validloan?(amount)
  amount.to_i > 1 && amount.to_i != 0
end

def validrate?(rate)
  rate.to_f >= 0 && rate
end

def validduration?(duration)
  duration / 12 >= 1 && duration % 12 == 0
end

prompt("Welcome, use this loan calculator to calculate your monthly mortgage payment.")
prompt("Please input your name:")

name = ''
loop do
  name = gets.chomp.capitalize

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}! Let's calculate your loan payment.")


loop do
    loan_amount = ''
    loop do
      prompt("Enter the amount of the loan $:")
      loan_amount = gets.chomp.to_i

      if validloan?(loan_amount)
        break
      else
        prompt("Please make sure your loan amount is greater than $1.00")
      end
    end

    interest_rate = ''
    loop do
      prompt("Enter your interest rate % (e.g. if your rate is 3.5%, enter 3.5, if 5%, enter 5):")
      interest_rate = gets.chomp.to_f / 100

      if validrate?(interest_rate)
        break
      else
        prompt("Please make sure the APR you entered is not a negative number.")
      end
    end

    loan_duration = ''
    loop do
      prompt("Please enter the term of the loan in months, e.g. a 10 year loan would be 120 months.")
      loan_duration = gets.chomp.to_f

      if validduration?(loan_duration)
        break
      else
        prompt("Something's not right, make sure your loan duration is a whole number divisible by 12 and at least 1 year.")
      end
    end

    if interest_rate == 0
      monthly_payment = loan_amount / loan_duration
    else
      monthly_payment = loan_amount * ((interest_rate / 12) / (1 - (1 + (interest_rate / 12))**(- loan_duration)))
    end

  prompt("Your monthly payment is $#{monthly_payment.round(2)}.")

  puts "Do you want to calculate another payment? Say 'Y' or 'N'."
  go_again = gets.chomp.downcase
  break unless go_again.downcase.start_with?('y')
end

prompt("Thank you for using mortgage calculator. Good bye!")