# frozen_string_literal: true

require './lib/statement'

describe Statement do

  let(:statement) { described_class.new }

  let(:transaction) {
    double :transaction,
    date: "23/05/2022",
    credit: 3000,
    debit: nil,
    balance: 3000
  }

  let(:another_transaction) {
    double :transaction,
    date: "24/05/2022",
    credit: 2000,
    debit: nil,
    balance: 5000
  }

  let(:a_debit_transaction) {
    double :transaction,
    date: "25/05/2022",
    credit: nil,
    debit: 1000,
    balance: 2000
  }

  describe '#log_transaction' do
    it 'adds the transaction to the transactions log' do
      statement.log_transaction(transaction)
      expect(statement.transactions).to include(transaction)
    end
  end

  describe '#display' do
    describe 'prints transactions' do

      it "prints a statement header 'date || credit || debit || balance'" do
        expect { statement.display }.to output(
          "date || credit || debit || balance\n"
        ).to_stdout
      end

      it "prints 'DD/MM/YYYY || 3000.00 || || 3000.00' as statement following single 3000 deposit" do
        statement.log_transaction(transaction)
        expect { statement.display }.to output(
          %r{\d{2}/\d{2}/\d{4} \|\| 3000.00 \|\|  \|\| 3000.00}
        ).to_stdout
      end

      it "prints 'DD/MM/YYYY || 5000.00 || || 5000.00' as statement following single 3000 deposit" do
        statement.log_transaction(another_transaction)
        expect { statement.display }.to output(
          %r{\d{2}/\d{2}/\d{4} \|\| 2000.00 \|\|  \|\| 5000.00}
        ).to_stdout
      end

      it 'prints multiple transactions each on separate lines most recent first' do
        statement.log_transaction(transaction)
        statement.log_transaction(another_transaction)
        expect { statement.display }.to output(
          %r{\d{2}/\d{2}/\d{4} \|\| 2000.00 \|\|  \|\| 5000.00\n\d{2}/\d{2}/\d{4} \|\| 3000.00 \|\|  \|\| 3000.00\n}
        ).to_stdout
      end

      it 'prints both credit and debit transactions' do
        statement.log_transaction(transaction)
        statement.log_transaction(a_debit_transaction)
        expect { statement.display }.to output(
          %r{\d{2}/\d{2}/\d{4} \|\|  \|\| 1000.00 \|\| 2000.00\n\d{2}/\d{2}/\d{4} \|\| 3000.00 \|\|  \|\| 3000.00\n}
        ).to_stdout
      end
    end
 



  end
end
