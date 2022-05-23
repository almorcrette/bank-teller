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
    if type == :credit
      @credit = amount
    else
      @debit = amount
    end
    self
  end

end