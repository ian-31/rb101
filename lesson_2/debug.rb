
def valid_loan?(amount)
  amount.to_f > 1.00
end

def get_loan_amount
  loop do
    puts 'loan amount'
    loan_amount = gets.chomp.to_f

    if valid_loan?(loan_amount)
      break
    else
    puts 'enter valid loan amount'
    end
  end
end

p get_loan_amount