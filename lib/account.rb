# frozen_string_literal: true

require_relative('./transaction')
require_relative('./statement')

# Account for holding customer balance and executing bank teller functions
class Account

  # Initiates with a statement, instance of Statement
  # Initiates with a Transaction class
  attr_reader :balance, :transactions

  def initialize(transaction_class = Transaction, statement = Statement.new)
    @balance = 0.00
    @statement = statement
    @transaction_class = transaction_class
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @statement.log_transaction(@transaction_class.create(type: :credit, amount: amount, balance: @balance))
    # log_transaction(:credit, amount)
  end

  def withdraw(amount)
    @balance -= amount
    @statement.log_transaction(@transaction_class.create(type: :debit, amount: amount, balance: @balance))
    # log_transaction(:debit, amount.to_f.round(2))
  end

  def print_statement
    @statement.display
  end


  # def print_statement
  #   print "date || credit || debit || balance\n"
  #   @transactions.reverse.each do |transaction|
  #     credit_formatted = format_amount(transaction[:credit])
  #     debit_formatted = format_amount(transaction[:debit])
  #     balance_formatted = format_amount(transaction[:balance])
  #     print "#{transaction[:date]} || #{credit_formatted} || #{debit_formatted} || #{balance_formatted}\n"
  #   end
  # end

  private

  # def log_transaction(transaction_type, amount)
  #   today = Time.now.strftime('%d/%m/%Y')

  #   @transactions.push(
  #     {
  #       date: today,
  #       "#{transaction_type}": amount,
  #       balance: @balance
  #     }
  #   )
  # end

  # def format_amount(amount)
  #   format('%.2f', amount) if amount
  # end
end
