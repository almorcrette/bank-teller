require './lib/transaction'

describe Transaction do
  
  describe '::create' do
    it 'initiates a new transaction instance with a datestamp' do
      transaction = Transaction.create
      expect(transaction.date).to match(%r{\d{2}/\d{2}/\d{4}})
    end
  end
end