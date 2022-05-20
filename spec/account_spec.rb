require './lib/account.rb'

describe Account do

  let(:account) { described_class.new }

  it 'initializes with a balance set to 0' do
    expect(account.balance).to eq(0)
  end

end
