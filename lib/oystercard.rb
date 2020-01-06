require_relative 'barrier'
require_relative 'journey_history'


class Oystercard
  DEFAULT_BALANCE = 10

  attr_accessor :balance, :in_journey, :journey_history

  def initialize(journey_history = JourneyHistory.new)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @journey_history = journey_history
  end

  def top_up(amount)
    @balance += amount
  end

  def tap_in(barrier)
    @in_journey = true
  end

  def tap_out(barrier)
    @in_journey = false
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
# p barrier2 = Barrier.new
# p oys.in_journey
# p oys.tap_in(barrier1)
# p oys.in_journey
# p oys.tap_out(barrier2)
# p oys.in_journey
# p oys.journey_history
