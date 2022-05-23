require './lib/statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:transaction) { double :transaction }
  
  describe '#log_transaction' do
    it 'adds the transaction to the transactions log' do
      statement.log_transaction(transaction)
      expect { statement.transaction }.to include(transaction)
    end
  end
end