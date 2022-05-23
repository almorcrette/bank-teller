class Statement
  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def log_transaction(transaction)
    @transactions << transaction
  end
end