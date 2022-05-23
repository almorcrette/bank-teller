# frozen_string_literal: true

require './lib/transaction'

describe Transaction do
  describe '::create' do
    describe 'initiates a new transaction instance' do
      it 'with a datestamp' do
        transaction = Transaction.create(type: :credit, amount: 1000, balance: 1000)
        expect(transaction.date).to match(%r{\d{2}/\d{2}/\d{4}})
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
end
