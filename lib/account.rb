# frozen_string_literal: true

# Account for holding customer balance and executing bank teller functions
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push({ credit: 1000 })
  end

  def withdraw(amount)
    @balance -= amount
  end
end
