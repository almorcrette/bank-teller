# frozen_string_literal: true

# Stores transactions and prints them
class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def log_transaction(transaction)
    @transactions << transaction
  end

  def print_statement
    print "date || credit || debit || balance\n"
  end
end
