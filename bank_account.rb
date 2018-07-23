class BankAccount
  @@interest_rate = 0.01
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def balance=(int)
    @balance = int
  end

  def deposit(int)
    @balance += int
  end

  def withdraw(int)
    @balance -= int
  end

  def self.create
    new_account = self.new
    @@accounts.push(new_account)
    return @@accounts.last
  end

  def self.total_funds
    total = 0
    @@accounts.each do |acc|
      total += acc.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |acc|
      acc.balance *= (1.00+@@interest_rate).round(2) #rounding
    end
  end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
