# frozen_string_literal: true

require './lib/statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:transaction) { double :transaction }

  describe '#log_transaction' do
    it 'adds the transaction to the transactions log' do
      statement.log_transaction(transaction)
      expect(statement.transactions).to include(transaction)
    end
  end

  describe '#print_statement' do
    it "prints a statement header 'date || credit || debit || balance'" do
      expect { statement.print_statement }.to output(
        "date || credit || debit || balance\n"
      ).to_stdout
    end

  end
end
