# frozen_string_literal: true

require './lib/account'

describe Account do
  let(:account) { described_class.new }

  it 'initializes with a balance set to 0' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    describe 'adds to the balance' do
      it 'increases the balance by 1000 when 1000 is added' do
        expect { account.deposit(1000) }.to change { account.balance }.from(0).to(1000)
      end
    end
  end
end
