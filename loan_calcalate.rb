
require 'colorize'
require "tty-prompt"
require "tty-box"
require "tty-screen"
require "tty-prompt"


def ask(prompt)
    puts prompt
    answer = gets.chomp
   return answer
end

print TTY::Box.frame "welcome to loan calculation", "lets get started!"

name = ask("what is your name".colorize(:green))
 while name.match(/^[[:alpha:][:blank:]]+$/) == nil
   puts "invalid input"
   name = ask("what is your name".colorize(:green))
 end
puts "Hello #{name}".colorize(:green)


income = ask("What is your income weekly".colorize(:green))

while income.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
  puts "invalid input"
  income = ask("how much is your rent weekly?".colorize(:green))
end


print TTY::Box.frame "great!, now just need some information about your expense"

 rent = ask("how much is your rent weekly?".colorize(:green))

  #while rent.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
    #puts "invalid input"
    rent = ask("how much is your rent weekly?".colorize(:green))
  #end


food = ask("how much is your food cost weekly?".colorize(:green))
while food.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
  puts "invalid input"
  food = ask("how much is your rent weekly?".colorize(:green))
end

transport = ask("how much is your transport cost weekly?".colorize(:green))
while transport.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
  puts "invalid input"
  transport = ask("how much is your rent weekly?".colorize(:green))
end

                                                 
credit_card_repayment = ask("do you have any credit card debt if not just enter 0?".colorize(:green))
while credit_card_repayment.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
  puts "invalid input"
  credit_card_repayment = ask("how much is your rent weekly?".colorize(:green))
end


loan_need = ask("how much loan you like to apply".colorize(:green))
while loan_need.match(/\A[+-]?\d+(\.\d+)?\z/) == nil
  puts "invalid input"
  loan_need = ask("how much is your rent weekly?".colorize(:green))
end


expense = transport.to_f + food.to_f + rent.to_f + credit_card_repayment.to_f  

print TTY::Box.frame "your total expense are #{expense}"
total_fund_after_expense = income.to_f - expense.to_f 
print TTY::Box.frame "your fund after expense are #{total_fund_after_expense.to_f}"
able_to_pay_back_weekly = total_fund_after_expense.to_f * 30 / 100   

print TTY::Box.frame "your ability to pay back weekly are #{able_to_pay_back_weekly}"


if(able_to_pay_back_weekly.to_f >=250 && loan_need.to_f <= 50000) 
print TTY::Box.frame "you are eligible for $#{loan_need}".colorize(:red)
   
elsif(able_to_pay_back_weekly.to_f >= 80 ) && (loan_need.to_f <= 5000) || (able_to_pay_back_weekly.to_f >= 80  && loan_need.to_f <= 10000)
    print TTY::Box.frame "#{name} you are eligible for $#{loan_need}".colorize(:red)
elsif(able_to_pay_back_weekly.to_f >= 100) && (loan_need.to_f <= 12000)
    print TTY::Box.frame "#{name} you are eligible for $#{loan_need}".colorize(:red)
elsif (able_to_pay_back_weekly.to_f >= 150 && loan_need.to_f <= 15000)
    print TTY::Box.frame "#{name}you are eligible for $#{loan_need}".colorize(:red)
elsif (able_to_pay_back_weekly.to_f < 80)
    print TTY::Box.frame "#{name}sorry maybe try again next time".colorize(:red)
    
end
                                                               



