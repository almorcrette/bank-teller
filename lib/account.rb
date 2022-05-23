# frozen_string_literal: true

require_relative('./transaction')
require_relative('./statement')

# Account for holding customer balance
# and executing deposit and withdraw actions
# and holding and printing a statement
class Account
  attr_reader :balance, :transactions

  def initialize(
    transaction_class = Transaction,
    statement = Statement.new
  )
    @balance = 0.00
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    raise 'positive amounts only' if amount.negative?

    @balance += amount
    @statement.log_transaction(generate_transaction(:credit, amount))
  end

  def withdraw(amount)
    raise 'positive amounts only' if amount.negative?

    @balance -= amount
    @statement.log_transaction(generate_transaction(:debit, amount))
  end

  def print_statement
    @statement.display
  end

  private

  def generate_transaction(type, amount)
    @transaction_class.create(type: type, amount: amount, balance: @balance)
  end
end
