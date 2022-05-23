# frozen_string_literal: true

require './lib/statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:transaction) {
    double :transaction,
    date: "23/05/2022",
    credit: 3000,
    balance: 3000
  }

  describe '#log_transaction' do
    it 'adds the transaction to the transactions log' do
      statement.log_transaction(transaction)
      expect(statement.transactions).to include(transaction)
    end
  end

  describe '#print_statement' do
    describe 'prints transactions' do
      it "prints a statement header 'date || credit || debit || balance'" do
        expect { statement.print_statement }.to output(
          "date || credit || debit || balance\n"
        ).to_stdout
      end
      it "prints 'DD/MM/YYYY || 3000.00 || || 3000.00' as statement following single 3000 deposit" do
        statement.log_transaction(transaction)
        expect { statement.print_statement }.to output(
          %r{\d{2}/\d{2}/\d{4} \|\| 3000.00 \|\|  \|\| 3000.00}
        ).to_stdout
      end
    end
 



  end
end
