class Transaction

  def self.create(balance:)
    Transaction.new(balance)
  end

  attr_reader :date, :balance

  def initialize(balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @balance = balance
  end

end