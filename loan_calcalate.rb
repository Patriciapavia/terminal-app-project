
require 'colorize'
require 'gosu'

def ask(prompt)
    puts prompt
    answer = gets.chomp
   return answer
end



puts"welcome to loan calculation".colorize(:light_blue)
puts "lets get started" .colorize(:light_blue) 
name = ask("what is your name".colorize(:light_blue))
puts "Hello #{name}".colorize(:green)
income = ask("What is your income weekly".colorize(:green)).to_f
puts "great!, now just need some information about your expense".colorize(:color => :light_blue)
     
rent = ask("how much is your rent weekly?").to_f

food = ask("how much is your food cost weekly?").to_f

transport = ask("how much is your transport cost weekly?").to_f
                                                       
credit_card_repayment = ask("do you have any credit card debt if not just enter 0?").to_f

loan_need = ask("how much loan you like to apply").to_f

expense = transport + food +rent + credit_card_repayment  

puts "your total expense are #{expense}"

total_fund_after_expense = income - expense  

puts "your fund after expense are #{total_fund_after_expense}"

able_to_pay_back_weekly = total_fund_after_expense * 30 / 100   


puts "your ability to pay back weekly are #{able_to_pay_back_weekly}" 
   
if(able_to_pay_back_weekly>=250 && loan_need <= 50000) 
    puts "you are eligible for #{loan_need}"
elsif(able_to_pay_back_weekly >= 80 ) && (loan_need <= 5000) || (able_to_pay_back_weekly >= 80  && loan_need <= 10000)
 puts "you are eligible for $5000 "
elsif(able_to_pay_back_weekly >= 100) && (loan_need <= 10000)
    puts "you are eligible for $10000"
elsif (able_to_pay_back_weekly >= 150 && loan_need <= 15000)
 puts "you are eligible for $15000"
elsif (able_to_pay_back_weekly < 80)
    puts "sorry maybe try again in three month"
end
                                                               



