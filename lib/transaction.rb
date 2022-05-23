class Transaction

  def self.create
    Transaction.new
  end

  attr_reader :date

  def initialize
    @date = Time.now.strftime('%d/%m/%Y')
  end

end