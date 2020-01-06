require_relative 'barrier'

class Oystercard
  DEFAULT_BALANCE = 10

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    @balance += amount
  end

  def tap_in(barrier)
  end
end

# to run in terminal:

# ruby 'lib/oystercard.rb'

# unhash:
# p oys = Oystercard.new
# p oys.balance
# p oys.top_up(10)
# p oys.balance
# p barrier1 = Barrier.new
# p oys.tap_in(barrier1)
