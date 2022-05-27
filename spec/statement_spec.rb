# frozen_string_literal: true

require './lib/statement'

describe Statement do
  let(:statement) { described_class.new }

  let(:transaction) do
    double :transaction,
           date: '23/05/2022',
           credit: 3000,
           debit: nil,
           balance: 3000
  end

  let(:another_transaction) do
    double :transaction,
           date: '24/05/2022',
           credit: 2000,
           debit: nil,
           balance: 5000
  end

  let(:a_debit_transaction) do
    double :transaction,
           date: '25/05/2022',
           credit: nil,
           debit: 1000,
           balance: 2000
  end

  describe '#log_transaction' do
    it 'adds the transaction to the transactions log' do
      statement.log_transaction(transaction)
      expect(statement.transactions).to include(transaction)
    end
  end

  describe '#display' do
    describe 'prints transactions' do
      it "including a statement header: 'date || credit || debit || balance'" do
        expect { statement.display }.to output(
          "date || credit || debit || balance\n"
        ).to_stdout
      end

      it "e.g. 'DD/MM/YYYY || 3000.00 || || 3000.00' as statement following single 3000 deposit" do
        statement.log_transaction(transaction)
        expect { statement.display }.to output(
          "date || credit || debit || balance\n23/05/2022 || 3000.00 || || 3000.00\n"
        ).to_stdout
      end

      it "e.g. 'DD/MM/YYYY || 5000.00 || || 5000.00' as statement following single 3000 deposit" do
        statement.log_transaction(another_transaction)
        expect { statement.display }.to output(
          "date || credit || debit || balance\n24/05/2022 || 2000.00 || || 5000.00\n"
        ).to_stdout
      end

      it 'each on separate lines most recent first' do
        statement.log_transaction(transaction)
        statement.log_transaction(another_transaction)
        expect { statement.display }.to output(
          "date || credit || debit || balance\n24/05/2022 || 2000.00 || || 5000.00\n23/05/2022 || 3000.00 || || 3000.00\n"
        ).to_stdout
      end

      it 'both credit and debit' do
        statement.log_transaction(transaction)
        statement.log_transaction(a_debit_transaction)
        expect { statement.display }.to output(
          "date || credit || debit || balance\n25/05/2022 || || 1000.00 || 2000.00\n23/05/2022 || 3000.00 || || 3000.00\n"
        ).to_stdout
      end
    end
  end
end
