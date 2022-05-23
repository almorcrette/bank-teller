# frozen_string_literal: true

# Next steps:
# edge case negative amounts

require './lib/account'

describe Account do

  let(:transaction) { double :transaction }
  let(:transaction_class) {
    double :transaction_class,
    create: transaction }
  let(:statement) { double :statement }
  let(:account) { described_class.new(transaction_class, statement) }

  it 'initializes with a balance set to 0' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do

    describe 'adds to the balance' do
      it 'e.g. increases the balance by 1000 when 1000 is deposited' do
        allow(statement).to receive(:log_transaction)
        expect { account.deposit(1000) }.to change { account.balance }.from(0).to(1000)
      end

      it 'e.g. increases the balance by 2000 when 2000 is deposited' do
        allow(statement).to receive(:log_transaction)
        expect { account.deposit(2000) }.to change { account.balance }.from(0).to(2000)
      end
    end

    it 'logs credit transaction in the statement' do
      expect(transaction_class).to receive(:create)
      expect(statement).to receive(:log_transaction).with(transaction)
      account.deposit(1000)
    end

  end

  describe '#withdraw' do

    describe 'removes from the balance' do
      it 'e.g. reduces the balance by 1000 when 1000 is withdrawn' do
        allow(statement).to receive(:log_transaction)
        account.deposit(1000)
        expect { account.withdraw(1000) }.to change { account.balance }.from(1000).to(0)
      end
    end

    it 'logs debit transaction in the statement' do
      allow(statement).to receive(:log_transaction)
      account.deposit(1000)
      expect(transaction_class).to receive(:create)
      expect(statement).to receive(:log_transaction).with(transaction)
      account.withdraw(1000)
    end

  end

  describe '#print_statement' do
    it 'calls statement to display' do
      expect(statement).to receive(:display)
      account.print_statement
    end
  end

end
