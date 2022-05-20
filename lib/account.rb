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
    log_transaction(:credit, amount)
  end

  def withdraw(amount)
    @balance -= amount
    log_transaction(:debit, amount)
  end

  private

  def log_transaction(transaction_type, amount)
    today = Time.now.strftime('%d/%m/%Y')
    @transactions.push({ date: today, "#{transaction_type}": amount, balance: @balance })
  end
end
