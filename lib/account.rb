# frozen_string_literal: true

# Account for holding customer balance and executing bank teller functions
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    log_transaction(:credit, amount)
  end

  def withdraw(amount)
    @balance -= amount
    log_transaction(:debit, amount.to_f.round(2))
  end

  def print_statement
    print "date || credit || debit || balance\n"
    @transactions.each do |transaction|
      credit_formatted = format_amount(transaction[:credit])
      debit_formatted = format_amount(transaction[:debit])
      balance_formatted = format_amount(transaction[:balance])
      print "#{transaction[:date]} || #{credit_formatted} || #{debit_formatted} || #{balance_formatted}\n"
    end
  end

  private

  def log_transaction(transaction_type, amount)
    today = Time.now.strftime('%d/%m/%Y')

    @transactions.push(
      {
        date: today,
        "#{transaction_type}": amount,
        balance: @balance
      }
    )
  end

  def format_amount(amount)
    format('%.2f', amount) if amount
  end
end
