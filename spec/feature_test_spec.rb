# frozen_string_literal: true

require './lib/account'

describe 'Bank Teller program' do
  it 'meets the acceptance criteria' do
    acc = Account.new
    acc.deposit(1000)
    acc.deposit(2000)
    acc.withdraw (500)
    expect { acc.print_statement }.to output(/date || credit || debit || balance\n\d{2}\/\d{2}\/\d{4} \|\|  \|\| 500.00 \|\| 2500.00\n\d{2}\/\d{2}\/\d{4} \|\| 2000.00 \|\|  \|\| 3000.00\n\d{2}\/\d{2}\/\d{4} \|\| 1000.00 \|\|  \|\| 1000.00\n/).to_stdout
  end
end
