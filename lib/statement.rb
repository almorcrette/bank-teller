# frozen_string_literal: true

# Stores transactions and display them
class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log_transaction(transaction)
    @transactions << transaction
  end

  def display
    display_header
    @transactions.reverse.each do |transaction|
      credit_formatted = format_amount(transaction.credit)
      debit_formatted = format_amount(transaction.debit)
      balance_formatted = format_balance(transaction.balance)
      print "#{transaction.date} || #{credit_formatted}|| #{debit_formatted}|| #{balance_formatted}\n"
    end
  end

  private

  def format_amount(amount)
    format('%.2f ', amount) if amount
  end

  def format_balance(balance)
    format('%.2f', balance)
  end

  def display_header
    print "date || credit || debit || balance\n"
  end
end
