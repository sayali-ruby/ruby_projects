# require 'pry'
# 
# Entered Account balance: [10000, 5000, 25000, 15000, 12000]
# -----------------------
# :: Account Details ::
# ======================
#  Account 1: 10000
# -----------------------
#  Account 2: 5000
# -----------------------
#  Account 3: 25000
# -----------------------
#  Account 4: 15000
# -----------------------
#  Account 5: 12000
# -----------------------
# ======================
# case 1: If you are investing 15,000 then it should deduct from Account 4
# Investing Amount of 15000
# Withdraw amount 15000 from Account 4
# ======================
# case 2: If you are investing 20,000 then it should deduct from Account 3
# Investing Amount of 20000
# Withdraw amount 20000 from Account 3
# ======================
# case 3: If you are investing 30,000 then it should deduct from Account 3 - 25,000 and Account 2- 5,000
# Investing Amount of 30000
# Withdraw amount 25000 from Account 3
# Withdraw amount 5000 from Account 2

class Account

  def initialize(amounts)
    return 'Enter valid Array' unless amounts.class.eql?(Array) 
    return 'Amount should be greater then 0' unless amounts.min.positive?
    @balance = amounts
  end

  def closest_amount(amount)
    @balance.min_by{ |balance| (amount - balance).abs }
  end

  def invest(amount)
    while amount > 0
      closest_amount = closest_amount(amount)
      withdraw_amount = [amount, closest_amount].min
      puts "Withdraw amount #{withdraw_amount} from Account #{@balance.index(closest_amount) + 1}"
      amount = amount - closest_amount
    end
  end

end

amounts = [10000, 5000, 25000, 15000, 12000]
puts "Entered Account balance: #{amounts}"
puts "-----------------------"
Account.new(amounts)
puts ":: Account Details ::"
puts "======================"
amounts.each do |balance|
  puts " Account #{amounts.index(balance) + 1}: #{balance}"
  puts "-----------------------"
end
puts "======================"


puts "case 1: If you are investing 15,000 then it should deduct from Account 4"
puts "Investing Amount of 15000"
Account.new(amounts).invest(15000)

puts "======================"

puts "case 2: If you are investing 20,000 then it should deduct from Account 3"
puts "Investing Amount of 20000"
Account.new(amounts).invest(20000)

puts "======================"

puts "case 3: If you are investing 30,000 then it should deduct from Account 3 - 25,000 and Account 2- 5,000"
puts "Investing Amount of 30000"
Account.new(amounts).invest(30000)