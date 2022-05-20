# frozen_string_literal: true

require './lib/account'

describe Account do
  let(:account) { described_class.new }

  it 'initializes with a balance set to 0' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    describe 'adds to the balance' do
      it 'increases the balance by 1000 when 1000 is deposited' do
        expect { account.deposit(1000) }.to change { account.balance }.from(0).to(1000)
      end
    end

    describe 'adds a credit transaction to the list of transactions' do
      it 'adds hash with credit key and 1000 value to transactions when 1000 is deposited' do
        account.deposit(1000)
        expect(account.transactions[0][:credit]).to eq(1000)
      end

      it 'adds hash with credit key and 2000 value to transactions when 2000 is deposited' do
        account.deposit(2000)
        expect(account.transactions[0][:credit]).to eq(2000)
      end

      describe 'transaction is dated' do
        it 'adds hash with date key and a value of date formatted DD/MM/YYYY to transactions' do
          account.deposit(1000)
          expect(account.transactions[0][:date]).to match(%r{\d{2}/\d{2}/\d{4}})
        end
      end

      describe 'transaction includes updated balance' do
        it 'adds hash with balance key and updated 1000 balance as value to initial 1000 credit transaction' do
          account.deposit(1000)
          expect(account.transactions[0][:balance]).to eq(1000)
        end

        it 'adds hash with balance key and updated 2000 balance as value to initial 2000 credit transaction' do
          account.deposit(2000)
          expect(account.transactions[0][:balance]).to eq(2000)
        end
      end
    end
  end

  describe '#withdraw' do
    describe 'removes from the balance' do
      it 'reduces the balance by 1000 when 1000 is withdrawn' do
        account.deposit(1000)
        expect { account.withdraw(1000) }.to change { account.balance }.from(1000).to(0)
      end
    end

    describe 'adds a debit transaction to the list of transactions' do
      it 'adds hash with debit key and 1000 value to transactions when 1000 is withdrawn' do
        account.deposit(2000)
        account.withdraw(1000)
        expect(account.transactions[-1][:debit]).to eq(1000)
      end

      it 'adds hash with debit key and 2000 value to transactions when 2000 is withdrawn' do
        account.deposit(3000)
        account.withdraw(2000)
        expect(account.transactions[-1][:debit]).to eq(2000)
      end

      describe 'transaction is dated' do
        it 'adds hash with date key and a value of date formatted DD/MM/YYYY to transactions' do
          account.deposit(2000)
          account.withdraw(1000)
          expect(account.transactions[-1][:date]).to match(%r{\d{2}/\d{2}/\d{4}})
        end
      end

      describe 'transaction includes updated balance' do
        it 'adds hash with balance key and updated 1000 balance as value to 2000 debit transaction from 3000 balance' do
          account.deposit(3000)
          account.withdraw(2000)
          expect(account.transactions[-1][:balance]).to eq(1000)
        end
        it 'adds hash with balance key and updated 2000 balance as value to 1000 debit transaction from 3000 balance' do
          account.deposit(3000)
          account.withdraw(1000)
          expect(account.transactions[-1][:balance]).to eq(2000)
        end
      end
    end
  end

  describe '#print_statement' do
    describe 'prints transactions' do
      it "prints 'DD/MM/YYYY || 3000.00 || || 3000.00' as statement following single 3000 deposit" do
        account.deposit(3000)
        expect { account.print_statement }.to output(
          %r{\d{2}/\d{2}/\d{4} || 3000.00 ||  || 3000.00}
        ).to_stdout
      end

      it "prints 'DD/MM/YYYY || 5000.00 || || 5000.00' as statement following single 3000 deposit" do
        account.deposit(5000)
        expect { account.print_statement }.to output(
          %r{\d{2}/\d{2}/\d{4} || 5000.00 ||  || 5000.00}
        ).to_stdout
      end
    end
  end
end
