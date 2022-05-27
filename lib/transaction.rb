# frozen_string_literal: true

# Records transactions by
# date, amount, type of transaction and balance after transaction
class Transaction
  def self.create(type:, amount:, balance:)
    Transaction.new(balance).parse_transaction(type, amount)
  end

  attr_reader :date, :balance, :credit, :debit

  def initialize(balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @balance = balance
  end

  def parse_transaction(type, amount)
    raise 'type must be :credit or :debit' if type_not_valid?(type)

    raise 'amount must be positive non-zero' if amount_not_valid?(amount)

    type == :credit ? @credit = amount : @debit = amount
    self
  end

  private

  def type_not_valid?(type)
    type != :credit && type != :debit
  end

  def amount_not_valid?(amount)
    !amount || amount <= 0
  end
end
