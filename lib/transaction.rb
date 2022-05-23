class Transaction

  def self.create(type:, amount:, balance:)
    Transaction.new(type, amount, balance)
  end

  attr_reader :date, :balance, :credit

  def initialize(type, amount, balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @balance = balance
    @credit = amount
  end

end