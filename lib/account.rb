# frozen_string_literal: true

require_relative('./transaction')
require_relative('./statement')

# Account for holding customer balance and executing bank teller functions
class Account
  attr_reader :balance, :transactions

  def initialize(transaction_class = Transaction, statement = Statement.new)
    @balance = 0.00
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    @statement.log_transaction(@transaction_class.create(type: :credit, amount: amount, balance: @balance))
  end

  def withdraw(amount)
    @balance -= amount
    @statement.log_transaction(@transaction_class.create(type: :debit, amount: amount, balance: @balance))

  end

  def print_statement
    @statement.display
  end

end
