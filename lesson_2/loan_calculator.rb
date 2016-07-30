def prompt(message)
  puts ">>> #{message}"
end

def valid_number?(num)
  num.to_i > 0 && num.to_i != 0
end

puts ""
puts "--> Welcome to the Mortgage Loan Calculator! <--".center(60)
puts "This calculator will estimate your monthly mortgage payment.".center(60)
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".center(60)

loop do
  prompt "To start, please enter the total loan amount:"

  loan_amount = ''
  loop do
    loan_amount = gets.chomp.delete('$,').to_f

    if valid_number?(loan_amount)
      break
    else
      prompt "Please enter a valid loan amount."
      prompt "(Numbers only. No letters or special characters.)"
    end
  end

  apr = ''
  loop do
    prompt "Enter the Annual Percentage Rate (APR) for your loan:"
    prompt "If your rate is 5%, enter 5. If your rate is 2.5%, enter 2.5."
    apr = gets.chomp.delete('%,').to_f

    if valid_number?(apr) && apr <= 100
      break
    else
      prompt "Hmm, it looks like you entered an invalid interest rate."
    end
  end

  loan_years = ''
  loop do
    prompt "Enter the loan term in years:"
    loan_years = gets.chomp.delete(',').to_f

    if valid_number?(loan_years) && loan_years <= 100
      break
    else
      prompt "Hmmm, that doesn't appear to be a valid number loan term."
    end
  end

  loan_months = loan_years * 12
  monthly_rate = (apr / 100) / 12
  monthly_payment = loan_amount *
                    (monthly_rate * (1 + monthly_rate)**loan_months) /
                    ((1 + monthly_rate)**loan_months - 1)

  prompt "Your monthly payment will be: $#{monthly_payment.to_f.round(2)}"
  puts ""
  prompt "Would you like to do another calculation? (y/n)"
  response = gets.chomp.downcase

  break unless response.start_with?('y')
end

puts "Thanks for using the Mortgage calculator!"
puts "Have a great day!"
