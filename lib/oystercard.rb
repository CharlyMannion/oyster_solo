require_relative 'barrier'
require_relative 'journey_history'
require_relative 'journey'


class Oystercard
  DEFAULT_BALANCE = 10
  MAX_CHARGE = 5

  attr_accessor :balance, :in_journey, :journey_history, :current_journey, :max_charge

  def initialize(journey_history = JourneyHistory.new, journey_class = Journey, max_charge = MAX_CHARGE)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @journey_history = journey_history
    @journey_class = journey_class
    @current_journey
    @max_charge = max_charge
  end

  def top_up(amount)
    @balance += amount
  end

  def tap_in(barrier)
    @in_journey = true
    new_journey = @journey_class.new
    new_journey.commence_at(barrier)
    @current_journey = new_journey
  end

  def tap_out(barrier)
    @in_journey = false
    @current_journey.terminate_at(barrier)
    for_history = @current_journey
    @journey_history.record(for_history)
  end

  def charge_fare(amount)
    @balance -= amount
  end
end

# to run feature tests in terminal:

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
# p "current journey after tap in below"
# p oys.current_journey
# p oys.in_journey
# p oys.tap_out(barrier2)
# p "current journey after tap out below"
# p oys.current_journey
# p oys.in_journey
# p oys.journey_history
# p "second journey below"
# p oys.tap_in(barrier2)
# p "current journey below"
# p oys.current_journey
# p oys.tap_out(barrier1)
# p oys.journey_history
