require './lib/transaction'

describe Transaction do
  
  describe '::create' do
    describe 'initiates a new transaction instance' do
      it 'with a datestamp' do
        transaction = Transaction.create(balance: 1000)
        expect(transaction.date).to match(%r{\d{2}/\d{2}/\d{4}})
      end

      describe 'with balance data' do
        it 'records a balance of 1000 when passed 1000 as balance argument' do
          transaction = Transaction.create(balance: 1000)
          expect(transaction.balance).to eq(1000)
        end

        it 'records a balance of 2000 when passed 2000 as balance argument' do
          transaction = Transaction.create(balance: 2000)
          expect(transaction.balance).to eq(2000)
        end

        it 'records a balance of 2000 when passed 2000 as balance argument' do
          transaction = Transaction.create(balance: 3000)
          expect(transaction.balance).to eq(3000)
        end


      end
    end
  end
end