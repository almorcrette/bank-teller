# frozen_string_literal: true

require './lib/account'

describe Account do
  let(:transaction) { double :transaction }

  let(:transaction_class) do
    double :transaction_class,
           create: transaction
  end

  let(:statement) { double :statement }

  let(:statement_class) do
    double :statement_class,
           new: statement
  end

  let(:account) { described_class.new(transaction_class, statement_class) }

  it 'initializes with a balance set to 0' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    it 'logs 1000 credit transaction with new balance of 1000 in the statement' do
      expect(transaction_class).to receive(:create).with(type: :credit, balance: 1000, amount: 1000)
      account.deposit(1000)
      expect(account.transactions).to include(transaction)
    end

    it 'logs 2000 credit transaction with new balance of 2000 in the statement' do
      expect(transaction_class).to receive(:create).with(type: :credit, balance: 2000, amount: 2000)
      account.deposit(2000)
      expect(account.transactions).to include(transaction)
    end

    it 'raises an error if amount is negative' do
      expect { account.deposit(-1000) }.to raise_error('positive amounts only')
    end
  end

  describe '#withdraw' do
    it 'logs 1000 debit transaction from an account with 1000 with new balance of 0 in the statement' do
      allow(statement).to receive(:log_transaction)
      account.deposit(1000)
      expect(transaction_class).to receive(:create).with(type: :debit, balance: 0, amount: 1000)
      account.withdraw(1000)
      expect(account.transactions.last).to eq(transaction)
    end

    it 'raises an error if amount is negative' do
      expect { account.withdraw(-1000) }.to raise_error('positive amounts only')
    end
  end

  describe '#print_statement' do
    it 'calls statement to display' do
      expect(statement_class).to receive(:new).with(account)
      expect(statement).to receive(:display)
      account.print_statement
    end
  end
end
