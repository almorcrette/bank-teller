# frozen_string_literal: true

# Account for holding customer balance and executing bank teller functions
class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end
end
