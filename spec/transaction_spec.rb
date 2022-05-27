# frozen_string_literal: true

require './lib/transaction'

describe Transaction do
  describe '::create' do
    describe 'initiates a new transaction instance' do
      it 'with a datestamp' do
        allow(Time).to receive(:now).and_return Time.new(2022, 5, 24)
        transaction = Transaction.create(type: :credit, amount: 1000, balance: 1000)
        expect(transaction.date).to match('24/05/2022')
      end

      describe 'with balance data' do
        it 'e.g. records a balance of 1000 when passed 1000 as balance argument' do
          transaction = Transaction.create(type: :credit, amount: 1000, balance: 1000)
          expect(transaction.balance).to eq(1000)
        end

        it 'e.g. records a balance of 2000 when passed 2000 as balance argument' do
          transaction = Transaction.create(type: :credit, amount: 1000, balance: 2000)
          expect(transaction.balance).to eq(2000)
        end

        it 'e.g. records a balance of 3000 when passed 3000 as balance argument' do
          transaction = Transaction.create(type: :credit, amount: 1000, balance: 3000)
          expect(transaction.balance).to eq(3000)
        end
      end

      describe 'with an amount and a defined type (credit or debit)' do
        it 'e.g. passes 1000 as credit if arguments are type: credit and amount: 1000' do
          transaction = Transaction.create(type: :credit, amount: 1000, balance: 3000)
          expect(transaction.credit).to eq(1000)
        end

        it 'e.g. passes 2000 as credit if arguments are type: credit and amount: 2000' do
          transaction = Transaction.create(type: :credit, amount: 2000, balance: 3000)
          expect(transaction.credit).to eq(2000)
        end

        it 'e.g. passes 1000 as debit if arguments are type: debit and amount: 1000' do
          transaction = Transaction.create(type: :debit, amount: 1000, balance: 3000)
          expect(transaction.debit).to eq(1000)
        end
      end
    end
  end

  describe '#parse_transaction' do
    describe 'allocates the amount to credit or debit based on type of transaction' do
      it 'e.g. sets credit to 1000 if called with type: credit and amount: 1000' do
        transaction = Transaction.new(0)
        transaction.parse_transaction(:credit, 1000)
        expect(transaction.credit).to eq(1000)
      end

      it 'raises an error if transaction type not debit or credit' do
        transaction = Transaction.new(0)
        expect { transaction.parse_transaction(:something_invalid, 1000) }
          .to raise_error('type must be :credit or :debit')
      end

      it 'raises an error if transaction amount is nil' do
        transaction = Transaction.new(0)
        expect { transaction.parse_transaction(:debit, nil) }
          .to raise_error('amount must be positive non-zero')
      end

      it 'raises an error if transaction amount is not positve non-zero' do
        transaction = Transaction.new(0)
        expect { transaction.parse_transaction(:debit, 0) }
          .to raise_error('amount must be positive non-zero')
      end
    end
  end
end
