# frozen_string_literal: true

# Records transactions by
# date, amount, type of transaction and balance after transaction
class Transaction
  def self.create(type:, amount:, balance:)
    Transaction.new(balance).parse_transaction(type, amount)
  end

  attr_reader :date, :balance, :credit, :debit

  def initialize(balance)
    @date = Date.today.strftime('%d/%m/%Y')
    @balance = balance
  end

  def parse_transaction(type, amount)
    type == :credit ? @credit = amount : @debit = amount
    self
  end
end
