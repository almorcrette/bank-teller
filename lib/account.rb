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
    credit_two_decimals = sprintf("%.2f", transactions[0][:credit])
    balance_two_decimals = sprintf("%.2f", transactions[0][:balance])
    print "#{@transactions[0][:date]} || #{credit_two_decimals} || #{transactions[0][:debit]} || #{balance_two_decimals}"
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
end
