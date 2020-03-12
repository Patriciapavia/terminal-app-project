
require 'colorize'
require "tty-prompt"
require "tty-box"
prompt = TTY::Prompt.new

def ask(prompt)
    puts prompt
    answer = gets.chomp
   return answer
end


print TTY::Box.frame "welcome to loan calculation", "lets get started!"

name = ask("what is your name".colorize(:light_blue))
puts "Hello #{name}".colorize(:green)
income = ask("What is your income weekly".colorize(:light_blue)).to_f
print TTY::Box.frame "great!, now just need some information about your expense"

rent = ask("how much is your rent weekly?".colorize(:green)).to_f

food = ask("how much is your food cost weekly?".colorize(:green)).to_f

transport = ask("how much is your transport cost weekly?".colorize(:green)).to_f
                                                       
credit_card_repayment = ask("do you have any credit card debt if not just enter 0?".colorize(:green)).to_f

loan_need = ask("how much loan you like to apply".colorize(:green)).to_f

expense = transport + food +rent + credit_card_repayment  

print TTY::Box.frame "your total expense are #{expense}"
total_fund_after_expense = income - expense  
print TTY::Box.frame "your fund after expense are #{total_fund_after_expense}"
able_to_pay_back_weekly = total_fund_after_expense * 30 / 100   

print TTY::Box.frame "your ability to pay back weekly are #{able_to_pay_back_weekly}"

   

if(able_to_pay_back_weekly>=250 && loan_need <= 50000) 
print TTY::Box.frame "you are eligible for $#{loan_need}".colorize(:red)
   
elsif(able_to_pay_back_weekly >= 80 ) && (loan_need <= 5000) || (able_to_pay_back_weekly >= 80  && loan_need <= 10000)
    print TTY::Box.frame "you are eligible for $#{loan_need}".colorize(:red)
elsif(able_to_pay_back_weekly >= 100) && (loan_need <= 12000)
    print TTY::Box.frame "you are eligible for $#{loan_need}".colorize(:red)
elsif (able_to_pay_back_weekly >= 150 && loan_need <= 15000)
    print TTY::Box.frame "you are eligible for $#{loan_need}".colorize(:red)
elsif (able_to_pay_back_weekly < 80)
    print TTY::Box.frame "sorry maybe try again next time".colorize(:red)
    
end
                                                               



