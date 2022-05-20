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
    case transaction_type
    when :credit
      @transactions.push({ date: Time.now.strftime("%d/%m/%Y"), credit: amount })
    when :debit
      @transactions.push({ debit: amount })
    end
  end
end
