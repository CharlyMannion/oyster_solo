require_relative 'barrier'
require_relative 'journey_history'
require_relative 'journey'


class Oystercard
  DEFAULT_BALANCE = 10

  attr_accessor :balance, :in_journey, :journey_history, :current_journey

  def initialize(journey_history = JourneyHistory.new, journey_class = Journey)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @journey_history = journey_history
    @journey_class = journey_class
    @current_journey
  end

  def top_up(amount)
    @balance += amount
  end

  def tap_in(barrier)
    @in_journey = true
    @current_journey = [barrier]
    # new_journey = @journey_class.new
    # @journey_history.record(new_journey)
  end

  def tap_out(barrier)
    @in_journey = false
    @current_journey << barrier
  end
end

# to run in terminal:

# ruby 'lib/oystercard.rb'

# unhash:
# p jhist = JourneyHistory.new
# p oys = Oystercard.new(jhist)
# p oys = Oystercard.new
# p oys.journey_history
# p oys.balance
# p oys.top_up(10)
# p oys.balance
# p barrier1 = Barrier.new
# p barrier2 = Barrier.new
# p oys.in_journey
# p oys.tap_in(barrier1)
# p oys.current_journey
# p oys.in_journey
# p oys.tap_out(barrier2)
# p oys.in_journey
# p oys.journey_history
