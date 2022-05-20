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
  end

  describe '#withdraw' do
    describe 'removes from the balance' do
      it 'reduces the balance by 1000 when 1000 is withdrawn' do
        account.deposit(1000)
        expect { account.withdraw(1000) }.to change { account.balance }.from(1000).to(0)
      end
    end
  end
end
