# frozen_string_literal: true

require './lib/statement'

describe Statement do
  let(:transaction) do
    double :transaction,
           date: '23/05/2022',
           credit: 3000,
           debit: nil,
           balance: 3000
  end

  let(:a_debit_transaction) do
    double :transaction,
           date: '25/05/2022',
           credit: nil,
           debit: 1000,
           balance: 2000
  end

  let(:account) do
    double :account,
           transactions: [
             transaction,
             a_debit_transaction
           ]
  end

  let(:statement) { described_class.new(account) }

  describe '#display' do
    describe 'prints transactions' do
      it 'with header, latest first, both credit and debit' do
        expect { statement.display }.to output(
          "date || credit || debit || balance\n25/05/2022 || || 1000.00 || 2000.00\n23/05/2022 || 3000.00 || || 3000.00\n"
        ).to_stdout
      end
    end
  end
end
